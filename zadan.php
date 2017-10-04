<!DOCTYPE html>
<html lang="ru">
<head>
<title>Example PHP+Mysql</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
function region()
{
        var id_country = $('select[name="country"]').val();
        if(!id_country)
         {
                $('div[name="selReg"]').html('');
         }
        else
         {
                $.ajax({
                        type: "POST",
                        url: "zadan.php",
                        data: { id_country: id_country  },
                        cache: false,
                        success: function(responce){ $('div[name="selReg"]').html(responce);}
                });
        };

};
</script>

<style type="text/css">
    #str select.str { display: none;}
    .red { color:#FF0000;}
    .blue { color:#0000FF;}
</style>

</head>
<body>

<?php
// Подключекние к mysql
    $mysqli = new mysqli('localhost', 'root', '','test');
    $mysqli->set_charset("utf8");
    if($mysqli->connect_error)
    {
      die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
    }

echo '<select class="str" name="country" onchange="region();" style="width: 150px;">';
echo '<option value="">...</option>';
echo '<optgroup label="Выбор страны">';

$qr_result = $mysqli->query("select * from Classificator_Country");
while($data = $qr_result->fetch_array())
{
  $value=$data['Country_ID'];
  echo '<option value='.$value.'>'.$data['Country_Name'].'</option>';
}

echo '</optgroup>';
echo '</select>';
echo '</br>';
echo '<div id="str" name="selReg"></div>';

if(isset($_POST['id_country'])){
  echo '<select name="region" multiple="multiple" style="width: 150px;" >';
  $qr_result3 = $mysqli->query("select Region_Name from Classificator_Region WHERE Parent_ID=".$_POST['id_country']." ORDER BY NOT Region_Name IN ('Москва','Санкт-Петербург','Киев','Минск'), Region_Name ASC;") or die(mysqli_error());
               while($data = $qr_result3->fetch_array())
                {
                 if($data['Region_Name']=='Москва' || $data['Region_Name']=='Киев' || $data['Region_Name']=='Минск')
                                { echo '<option class="red">'.$data['Region_Name'].'</option>'; }
                 elseif($data['Region_Name']=='Санкт-Петербург')
                                { echo '<option class="blue">'.$data['Region_Name'].'</option>'; }
                 else {echo '<option>'.$data['Region_Name'].'</option>';}
                }
 echo '</select>';
}
?>

</body>
</html>


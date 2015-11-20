#  Master Script 

# SCRIPT FOR TABLE CREATION 


  echo "Script for table creation"
  echo "Do you want to run the table creation script"
  read answer
    if [ "$answer" = "yes" ]
    then
    continue
    hive -f table_creation_real_estate_mb.sh >> /scripts/logs/tablecreationlogs.txt
      if [ "$?" != "0" ]; then
      echo "[Error] failed to execute the table creation script" 1>&2
      exit 1
    fi
    echo -e "table created successfully"
    else
    break
   fi



# MAGIC BRICKS TRANSFORMATION SCRIPT - FLOOR DETAILS

echo "Script for floor details"
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   echo "Enter the state name"
   read statename
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -param state=$statename -f /scripts/mb_udf_floordetails.pig 
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute the pig script" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done
else
  break
fi

# MAGIC BRICKS TRANSFORMATION SCRIPT - BEDROOMS AND BATHROOMS

echo "Script for bedroom and bathroom column"
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -f /scripts/mb_udf_bedroom_bathroom.pig 
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute the pig script" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done
else
  break
fi



# MAGIC BRICKS TRANSFORMATION SCRIPT - BASEMENT DETAILS

echo "Script for basement details"
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -f /scripts/mb_udf_floor_basement.pig 
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute the pig script" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done

else
  break
fi

# MAGIC BRICKS TRANSFORMATION SCRIPT - Generating key (UID)

echo "Script for generating uuid" 
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -f /scripts/mb_udf_property_sk.pig 
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute pig script for unique key generation" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done
else
  break
fi


# MAGIC BRICKS TRANSFORMATION SCRIPT - PRICE CONVERSION

echo "Script for price conversion"
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -f /scripts/mb_udf_price_conversion.pig 
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute pig script for price conversion" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done
else
  break
fi



# MAGIC BRICKS TRANSFORMATION SCRIPT - POPULATING LOCALITY COLUMN

echo "Script for locality column"
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -f /scripts/mb_udf_locality.pig 
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute pig script for locality column" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done
else
  break
fi


# MAGIC BRICKS TRANSFORMATION SCRIPT - POPULATING PINCODE COLUMN

echo "Script for pincode column"
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -f /scripts/mb_udf_pincode.pig 
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute pig script for pincode column" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done
else
  break
fi

# MAGIC BRICKS TRANSFORMATION SCRIPT - REPLACING NULL WITH BLANK SPACE

echo "Script for replacing null"
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -f /scripts/mb_udf_null_removal.pig
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute pig script for features column" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done
else
  break
fi


# MAGIC BRICKS TRANSFORMATION SCRIPT - FLATTENING FEATURES COLUMN

echo "Script for features column"
echo "Do you want to run this script ?"
read answer
if [ "$answer" = "yes" ]
  then
  continue
echo "Enter the input path"
read input_path
echo "Enter the output path"
read output_path
for((;;))
  do
   echo "Enter the city name"
   read cityname
   pig -param input_path=$input_path -param output_path=$output_path -param city=$cityname -f /scripts/mb_udf_features.pig 
   if [ "$?" != "0" ]; then
    echo "[Error] failed to execute pig script for features column" 1>&2
    exit 1
  fi
    echo -e "script executed successfully"

echo "Do you want to run for another city"
read answer
if [ "$answer" = "yes" ]
  then
  continue
else
  break
fi
done
else
  break
fi








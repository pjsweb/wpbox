
# get plugin path
acf_zip_file="$(wp plugin path)/acf-pro.zip"

# key
key=$ACF_PRO_KEY

# get acf zip file
wget -q -O ${acf_zip_file} "http://connect.advancedcustomfields.com/index.php?p=pro&a=download&k=$key"

# install & activate acf
wp plugin install ${acf_zip_file} --activate

# add key
wp eval "acf_pro_update_license('${key}');"

# remove zip file
rm ${acf_zip_file}

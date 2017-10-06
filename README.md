# tsohost-wp-cli-updates-using-cron
#Updating Wordpress Automatically using WP-CLI and Cron

TSOHOST Cloud Hosting system uses a slight different system to run WP-CLI from shell scripts and then parsing the output from these scripts to email you on completion

I've compiled this as a reference as it is not in their knowledgebase articles

# Installing WP-CLI 

1. SSH into your Cloud. If you haven't enabled your Shell Access you can do it from the tool in your Cloud control panel.
2. Run the following command:
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar   -  this will download the wp-cli.phar file
In order to check if it's working on the Cloud you need to run the following command:
/usr/bin/php-5.6-cli wp-cli.phar --info

3. Now you should create an alias of /usr/bin/php-5.6-cli wp-cli.phar so you could run it by typing wp only.
Run the following command:

echo "alias wp='/usr/bin/php-5.6-cli /var/sites/d/domain.com/wp-cli.phar'" >> .bashrc  

where you need to replace 'domain.com' with your actual domain and 'd' with the first letter of the domain.

4. Run: source .bashrc

5. Now you can test if its working again using: wp --info

6. If this does not work delete .bashrc and do 3,4 & 5 again (if there is an existing .bashrc file it sometimes fails)

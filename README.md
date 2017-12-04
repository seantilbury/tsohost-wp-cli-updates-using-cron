# tsohost-wp-cli-updates-using-cron

# Updating Wordpress Automatically using WP-CLI and Cron

The TSOHOST Gridhost Cloud Hosting system uses a slight different system to run WP-CLI from shell scripts and then parsing the output from these scripts to email you on completion

I've compiled this as a reference as it is not in their knowledgebase articles and intend to add to this as I add new features

todo - (in no particular order)
Visual Regression Testing (if possible)
Backup to Dropbox

Using git clone from the comand line to automatically add the files
```
git clone https://github.com/seantilbury/tsohost-wp-cli-updates-using-cron /var/sites/y/youdomain.co.uk/public_html/
```
# Installing WP-CLI 

1. SSH into your Cloud. If you haven't enabled your Shell Access you can do it from the tool in your Cloud control panel.
2. Run the following command:
```
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  
```
-  this will download the wp-cli.phar file
In order to check if it's working on the Cloud you need to run the following command:
```
/usr/bin/php-5.6-cli wp-cli.phar --info
```

3. Now you should create an alias of /usr/bin/php-5.6-cli wp-cli.phar so you could run it by typing wp only.
Run the following command:
```
echo -e "alias wp='/usr/bin/php-5.6-cli ./wp-cli.phar'" >> .bashrc  
```


4. Run: 
```
source .bashrc
```

5. Now you can test if its working again using: 
```
wp --info
```

6. If this does not work delete .bashrc and do 3,4 & 5 again (if there is an existing .bashrc file it sometimes fails)
# Setting Defaults for WP-CLI on Gridhost based WordPress installs

wp-cli.yml (this file is loaded when the bash shell is run to set the defaults) ****check this works when called from CRONTAB****

```
path : public_html/
```
this is the default (publicly accessable) root directory on the gridhost system all other installations will be subdirectories of this

# Daily Updates Scripts

plugin-update.sh
theme-update.sh
update-core.sh
core-checksums.sh
wp-cli-update.sh
all reside in the root and they need to be executable, do this using
```
chmod +x filename.sh
```

# Weekly Database Optimisation

wp-db-optimise.sh
resides in root needs to be executable 
```
chmod +x wp-db-optimise.sh
```

# CRONTAB

In the Tsohost control panel navigate to Advanced management Tools, Cron Jobs
then select Advanced Mode
add
```
MAILTO="your@email.address"
# # # # # #
0 2 * * * /bin/bash /var/sites/y/yourwebsite.co.uk/plugin-update.sh
10 2 * * * /bin/bash /var/sites/y/yourwebsite.co.uk/theme-update.sh
20 2 * * * /bin/bash /var/sites/y/yourwebsite.co.uk/verify-core.sh
30 2 * * * /bin/bash /var/sites/y/yourwebsite.co.uk/wp-cli-update.sh
0 1 * * 0 /bin/bash /var/sites/y/yourwebsite.co.uk/wp-db-optimise.sh
```
<!---
Updates will run daily at midnight and database optimisation weekly on sunday at 1am
-->
changed to run staggered after 2am to see if this affects timeouts

# Testing Scripts

To test that these scripts run OK SSH into your site and sun the script manually buy using 
```
./wpcli.sh
```
and
```
./wp-db-optimise.sh
```

# Day to Day
Keep an eye on the emails that are sent from the CRONJOB and look for errors and check the operation of the site, just in case an update breaks it. if it does look at the email of the update plugins and log in by SSH and 
```
wp plugin nameofplugin --disable
```

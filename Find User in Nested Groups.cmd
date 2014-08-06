:: Change CN and OUs accordingly

dsget user "CN=Jimmy Freel,OU=Ordinary_Users,OU=NGD_Users,DC=acute,DC=xglasgow,DC=scot,DC=nhs,DC=uk" -memberOf -expand > c:\nestedgroups.log
# KeyMan
KEYMAN is a secured server for sharing symetrical ciphers between applications. 


It is currently under development. Contributions are welcome !


Features :

 * Manage statistical sectors as groups of users 
 * Manage users and roles
 * Allows several ciphers per group and manage validity dates
 * Automatically generate unique ciphers
 * Serves autheticated JSON API through https protocol
 * Allows crypting of ciphers with PKI (as future developments)

Business rules :

 * The administrator of Keyman belongs to the ADMIN group. He can only create statistical sectors and users. He has no access to keys.
 * Each statistical sector can own several keys. Keys validity period relies on dates. Valid keys can always be used for encryption.
 * Each statistical sector is assigned several users : KeyAdmin, StatAdmin, Statworkers. A user can belong to only one sector.
 * KeyAdmin is responsible for keys creation and maintenance. He can never use the keys for encryption nor decription.
 * StatAdmin is responsible for key access allowance regarding StatWorkers. He can use the keys for encryption or decryption.
 * KeyAdmin and StatAdmin can define a delegate within the sector's StatWorkers.
 * Every operation on the application is logged.




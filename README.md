**KEYMAN** is a secured server for sharing symetrical ciphers between applications.

It was designed to support your organisation in implementing "by design" the General Data Protection Regulation (GDPR). 

*Features:*

* Manage groups, users and roles
* Manage several keys per group
* Automatically generate unique ciphers
* Serves authenticated JSON API through https protocol
* Allows crypting of ciphers with PKI (not available yet)

*Copyright: Frédéric Champreux 2017*

*Licence: GPL v3*

**Introduction**

 * Keyman manages cryptographic keys for your organisation, and your organisation’s partners.

 * Keyman is a web application providing a secured centralized solution for managing secret key.

 * Keyman supports “by design” the European General Data Protection Regulation (GDPR) by addressing the pseudonymisation option: hiding identification information using cryptography.
The main difficulty resides in storing or sharing cryptographic keys without actually sending them by email or storing them in the cloud. 

 * Keyman serves cryptographic keys for your users, for the teams in your organisation, or for your business partners while ensuring roles segregation, keys validity control, access management, and usage audit trail. Sample implementations are provided that ensure hidden keys circulation and even prevent from network hijacking.

 * Keyman is a tool you are using at your own risks. Being Open Source, it shows you all the details of its realisation. Event though, it does not prevent you from implementing the good practices of IT, such as backing up the keys into a safe place.

**DISCLAIMER**
THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

**Business cases**

Your organisation manages personal data, which need to be protected. The “by design” sentence means that you cannot rely on good processes or willing users to make sure no leaks ever happen. So you need to protect personal identifiers (and sometimes other sensitive information) in a convenient way: creating pseudonyms. Cryptography provides an efficient, yet easy to use, way of creating pseudonyms by hiding, and then retrieving information using a secret key. 

*You need to protect the data you manage*

Register in Keyman, and start generating random secret keys. You don’t need to remember complex strings, only the key name is useful to you. The key itself is never disclosed out of the application. The description allows you to remember what the key is used for.

*You need to protect the data your team manages*

If you have several teams managing sensitive information, you create groups corresponding to your organisation’s business areas, business units, or project teams etc. Within the teams, roles are defined and role segregation is applied. Each team can manage several cryptographic keys, and manage their validity period and usage authorisation.

*You need to share the data with another team, or a business partner*

Of course, you don’t want to share your secret key so your business partner can read your data, even for a short period of time. Keyman lets you use another user’s key, for encryption only. So you can decrypt the to be shared data with your key, and encrypt with his, so he can finally read it. Remember, no key moves out Keyman, no key is visible!

**_An example of usage is provided in OracleDemo folder._**

**Governance and organisation**

Ensuring data confidentiality requires to apply a few good practices.

*Do not store data and keys on the same place*

*Create separate roles*

Keyman administrator

	The administrator manages groups and users. Nothing else.

Groups and users management

	The group manager assigns users to secret keys. Nothing else.

Secret Keys management

	The keys manager creates keys, and set expiration dates. Nothing else.

Secret Key user

	Only the user can access the keys he was assigned providing his credentials.

*Download and install*
Keyman is available (or it will be) in several ways:

 * Ruby on Rails ecosystem
 * If you are not yet familiar with Ruby on Rails, install it from http://rubyonrails.org
 * Open a console, and create a directory for your installation. Switch to that directory
 * Install git
 * Install the bundle utility: gem install bundle
 * Then clone the GitHub repository: https://github.com/fchampreux/keyman
 * Define database connection (database.yml) and smtp resources (smtp.rb)
 * Define the administrator’s email address in seed.rb
 * Run bundle install
 * Run rake db:init
 * Run rake db:migrate
 * Run rake db:seed
 * Open administrator's email and confirm the registration
 * Start using the application
 
 **Better ideas or willing to contribute?**
 
 Please fork the repository in GitHub!


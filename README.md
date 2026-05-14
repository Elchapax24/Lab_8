At the end of this "readme" are the additional instructions for the lab 8 use.
For the setup you must need to execute the following commands on your terminal
Install gems:

```bash
bundle install
```
then you have to set up the database executing
```bash
bin/rails db:setup
```
for view the app you must acces to the rails server envoirment executing
'rails server' in the unbtutu terminal
and visiting http://localhost:3000 on your browser

This project requires `libvips` for Active Storage image variants.

### Ubuntu / Debian

```bash
sudo apt install libvips
```

### Arch Linux

```bash
sudo pacman -S libvips
```

### macOS

```bash
brew install vips
```

Additional note:
The program was created on a university computer where "libvips" could not be installed, so the thumbnail images could not be tested. Additionally, cache files such as tmp, vendor, and log were deleted because the program size exceeded GitHub's limit. It was not possible to retest the program to verify that it would still function without these files, but it is likely that, being cache files, it will continue to work.

For Lab 8:
The following lab requires creating a user or logging in with an existing user to access the database; that is, the application is no longer public. To test users, the following existing accounts can be used:
admin@vetclinic.com
vet@vetclinic.com
owner@vetclinic.com
The password for all of these accounts is "password123"
additionally, i used a test acount to create a new user, the acount is mimail@mail.com and the password is "123456"


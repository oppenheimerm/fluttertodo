### Add internet permission in AndroidManifest.xml in android studio
You need to add this permission for user security. Whenever you download an app from 
play store, it asks for permission that application will use. Lets say you are 
downloading an application which must not use internet at all and if you don’t 
require any permission for that, it might be secretly putting data on some server. 
You need to explicitly put internet permission in AndroidManifest.xml, so user 
of your app will be aware of it
See: https://java2blog.com/add-internet-permission-in-androidmanifest-android-studio/
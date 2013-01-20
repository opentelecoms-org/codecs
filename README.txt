
The codecs
----------

  BroadVoice 16
  ITU G.722
  ITU G.722
  SILK
  GSM
  Speex

Architecture-specific notes
---------------------------

Some of the code has been optimized with assembly for specific
platforms, particularly for building on ARM (armeabi and armeabi-v7a)
which is useful for mobile devices like Android and iPhone.

Supported platforms
-------------------

The codecs are implemented in C/C++ and should compile on a range of
platforms.

Build scripts are provided for Android NDK users (see README-Android.txt).
This allows you to produce binary artifacts accessible using JNI
from any Android application.

Licenses and patent issues
--------------------------

This is a compilation of source code from different sources.  It is
based on the contents of the jni/ tree in the Sipdroid and Lumicall
projects.

The compilation is placed in the public domain without restriction.

The copyright for each source code artifact is documented separately
for each codec, along with the terms under which you are licensed to use
it.

Some of the codecs may use patented technologies and you are encouraged
to familiarise yourself with such restrictions and the legal
implications in your jurisdiction.

In particular, SILK provides a form where you may request a license:

   http://developer.skype.com/silk/license

and G.729 license information can be found here:

   http://www.sipro.com/g729_about.php


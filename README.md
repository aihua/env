## Linux and macOS Environment for Developping Initials and Settings

When you have a new PC and Laptop to develop, You can use this project
to setting up your environments for developping.

Copy `etc/profile.d/*.sh` to `/etc/profile.d`, change the version in the .sh file.
For example, you can set `JAVA_HOME`  for jdk 17,
using etc/profile.d/jse.sh in Linux by changing `jse_version` to `17.0.8.1+`.

For macOS, you should use the files in `osx` directory.

For Android developping, you can use the .sh in `android` directory to enable haxm feature.

For Nginx, you can use the config files in `nginx` directory.



## Want to contribute?

If you want to contribute through code or documentation, the [Contributing
guide is the best place to start][contributing]. If you have questions, feel free
to ask.


[contributing]: https://github.com/aihua/env/blob/master/CONTRIBUTING.md

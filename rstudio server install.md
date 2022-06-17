# Set up rstudio server  

This tutorial will help you to set up rstudio server. With rstudio server, you will use the R installed on the server and have access to all the files on the server. (I recommended you use `conda` to manage your environment and install your own R with `conda`).

* On **polaris**, do the following.

```
# create a screen
screen

# Pull down the Singularity image
singularity pull --name rstudio.simg docker://rocker/tidyverse:latest

# Create the local filesystem
TMPDIR=$HOME/rstudio-tmp
mkdir -p $TMPDIR/tmp/rstudio-server
mkdir -p $TMPDIR/var/{lib,run}
uuidgen > $TMPDIR/tmp/rstudio-server/secure-cookie-key
chmod 600 $TMPDIR/tmp/rstudio-server/secure-cookie-key

# Run the container
PASSWORD='aaa' PASSWORD='rstudio123' singularity exec \
--bind $TMPDIR/var/lib:/var/lib/rstudio-server \
--bind $TMPDIR/var/run:/var/run/rstudio-server \
--bind $TMPDIR/tmp:/tmp \
--bind /dartfs/rc/lab/S/Szhao \
rstudio.simg \
rserver \
--auth-none=0 \
--auth-pam-helper-path=pam-helper \
--www-address=127.0.0.1 \
--www-port=8789 \
--server-user $USER

# detach from the screen
# press ctrl + A + D
```

Note if this port is being used, change the port number. and of course you need to change the port number in the following commands too.

* On my local computer/laptop, do the following: 

  be sure to change user ID and port number accordingly.

```
# Create the SSH tunnel
ssh -N -f -L 8789:localhost:8789 d92495j@polaris.dartmouth.edu

http://localhost:8789
# log in as d92495j and password is aaa

# $ facter  > ejemplo_salida_facts.rb


aio_agent_version => 6.27.1
augeas => {
  version => "1.12.0"
}
disks => {
  nvme0n1 => {
    model => "Amazon Elastic Block Store",
    size => "10.00 GiB",
    size_bytes => 10737418240
  }
}
dmi => {
  bios => {
    release_date => "10/16/2017",
    vendor => "Amazon EC2",
    version => "1.0"
  },
  board => {
    asset_tag => "i-0b6801031945d832a",
    manufacturer => "Amazon EC2"
  },
  chassis => {
    asset_tag => "Amazon EC2",
    type => "Other"
  },
  manufacturer => "Amazon EC2",
  product => {
    name => "t3.large"
  }
}
ec2_metadata => {
  ami-id => "ami-0e9edcc3f6e03a867",
  ami-launch-index => "0",
  ami-manifest-path => "(unknown)",
  block-device-mapping => {
    ami => "sda1",
    ephemeral0 => "sdb",
    ephemeral1 => "sdc",
    root => "/dev/sda1"
  },
  events => {
    maintenance => {
      history => "[]",
      scheduled => "[]"
    }
  },
  hostname => "ip-172-31-12-98.eu-west-1.compute.internal",
  identity-credentials => {
    ec2 => {
      info => "{
  "Code" : "Success",
  "LastUpdated" : "2022-05-11T13:44:47Z",
  "AccountId" : "639988086142"
}"
    }
  },
  instance-action => "none",
  instance-id => "i-0b6801031945d832a",
  instance-life-cycle => "on-demand",
  instance-type => "t3.large",
  local-hostname => "ip-172-31-12-98.eu-west-1.compute.internal",
  local-ipv4 => "172.31.12.98",
  mac => "02:6c:ce:5c:9b:d9",
  metrics => {
    vhostmd => "<?xml version="1.0" encoding="UTF-8"?>"
  },
  network => {
    interfaces => {
      macs => {
        02:6c:ce:5c:9b:d9 => {
          device-number => "0",
          interface-id => "eni-058c169c14049169f",
          ipv4-associations => {
            34.248.155.120 => "172.31.12.98"
          },
          local-hostname => "ip-172-31-12-98.eu-west-1.compute.internal",
          local-ipv4s => "172.31.12.98",
          mac => "02:6c:ce:5c:9b:d9",
          owner-id => "639988086142",
          public-hostname => "ec2-34-248-155-120.eu-west-1.compute.amazonaws.com",
          public-ipv4s => "34.248.155.120",
          security-group-ids => "sg-08a0fd89c71484d47",
          security-groups => "aws-cloud9-PUP-Ivan-Maestro-fc93caa6868d4ae187c4dc813f3bd998-InstanceSecurityGroup-QR1QLSZI1G8W",
          subnet-id => "subnet-89665def",
          subnet-ipv4-cidr-block => "172.31.0.0/20",
          vpc-id => "vpc-e5ef219c",
          vpc-ipv4-cidr-block => "172.31.0.0/16",
          vpc-ipv4-cidr-blocks => "172.31.0.0/16"
        }
      }
    }
  },
  placement => {
    availability-zone => "eu-west-1a",
    availability-zone-id => "euw1-az1",
    region => "eu-west-1"
  },
  profile => "default-hvm",
  public-hostname => "ec2-34-248-155-120.eu-west-1.compute.amazonaws.com",
  public-ipv4 => "34.248.155.120",
  reservation-id => "r-055a14844c5eab792",
  security-groups => "aws-cloud9-PUP-Ivan-Maestro-fc93caa6868d4ae187c4dc813f3bd998-InstanceSecurityGroup-QR1QLSZI1G8W",
  services => {
    domain => "amazonaws.com",
    partition => "aws"
  }
}
ec2_userdata => #!/bin/bash

UNIX_USER="ubuntu"
UNIX_USER_HOME="/home/ubuntu"
ENVIRONMENT_PATH="/home/ubuntu/environment"
UNIX_GROUP=$(id -g -n "$UNIX_USER")

# Apply security patches
OPERATING_SYSTEM=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release | sed -e 's/^"//' -e 's/"$//')
if [ "$OPERATING_SYSTEM" == "amzn" ]; then
    yum -q -y update --security > /tmp/init-yum-update-security 2>&1 &
elif [ "$OPERATING_SYSTEM" == "ubuntu" ]; then
    unattended-upgrade &
fi

# add SSH key
install -g "$UNIX_GROUP" -o "$UNIX_USER" -m 755 -d "$UNIX_USER_HOME"/.ssh
cat <<'EOF' >> "$UNIX_USER_HOME"/.ssh/authorized_keys
# Important
# ---------
# The following public key is required by Cloud9 IDE
# Removing this key will make this EC2 instance inaccessible by the IDE
#
cert-authority ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwJMmjOPAgIT0OKm5bt3p8MrFF2lciGrnw8Mcvui/PZMZcIadbwljP3IscIQE80rsvfb//Y4h5HR288hDI5T7gNE2Zv0Thq60WGNpVVW5yEVtRvd+ObDPRHbL7+WniOQ/j8/QsW4hjjfB38jJzd/Byi4VQh9L/LweR68RV3IR8P2WNyehJwCVMDWdgs7XP6XHxG7zlnh5I+nNUuRr4RMddw23xgHe+Kt4lgyYEywPH6U6w7DNKcCHQauqIc6a8879SDftbT8nn+APEpT7einiVZazB4CkwiXWkez25ELHfVSY4tO1UomVoDcue6rCEkMO1HJ1kXcOOQ9yERDRSWQk6sUNw8kKXSJNjvNHLj59vVVIrR10EtYGfJ+ZdGIyjQexHuEMl/RW8WH4tZLSgz/YjadHuyhj6z46V7dzt5bLcVF+nf/6G64BBmvHvpMYxeZeMABSyKfV2dKmpt8PBiL1+9rUmxFBpD4KqX0YihWXaGGDtyYcjmi20bWUFI0OMdkmyiBgW4aLF8Z8SwMpSpVEA7OrONb00hrmQU10z1d3Hz3GLoX3PesJXWYwlxU4WbLtyBOl2iXvAFcNMtNsa7+f5xvA0ZAmXpevr2mkHJvVh1Y5SHUqD5LnwimffJFtW9aKpdZIEly//4zOqNqwhBWHu0Wqbdz5nVRC36BAxAZV0kw== fc93caa6868d4ae187c4dc813f3bd998@cloud9.amazon.com


#
# Add any additional keys below this line
#

EOF

# allow automatic shutdown
echo "$UNIX_USER    ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown" >> /etc/sudoers

ln -s /opt/c9 "$UNIX_USER_HOME"/.c9
chown -R "$UNIX_USER":"$UNIX_GROUP" "$UNIX_USER_HOME"/.c9 /opt/c9
install -g "$UNIX_GROUP" -o "$UNIX_USER" -m 755 -d "$ENVIRONMENT_PATH"

if [ "$ENVIRONMENT_PATH" == "/home/ec2-user/environment" ] && grep "alias python=python27" "$UNIX_USER_HOME"/.bashrc; then

    cat <<'EOF' > "$UNIX_USER_HOME"/.bashrc
# .bashrc

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# load nvm
export NVM_DIR="$HOME/.nvm"
[ "$BASH_VERSION" ] && npm() {
    # hack: avoid slow npm sanity check in nvm
    if [ "$*" == "config get prefix" ]; then which node | sed "s/bin\/node//";
    else $(which npm) "$@"; fi
}
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
rvm_silence_path_mismatch_check_flag=1 # prevent rvm complaints that nvm is first in PATH
unset npm # end hack


# User specific aliases and functions
alias python=python27

# modifications needed only in interactive mode
if [ "$PS1" != "" ]; then
    # Set default editor for git
    git config --global core.editor nano

    # Turn on checkwinsize
    shopt -s checkwinsize

    # keep more history
    shopt -s histappend
    export HISTSIZE=100000
    export HISTFILESIZE=100000
    export PROMPT_COMMAND="history -a;"

    # Source for Git PS1 function
    if ! type -t __git_ps1 && [ -e "/usr/share/git-core/contrib/completion/git-prompt.sh" ]; then
        . /usr/share/git-core/contrib/completion/git-prompt.sh
    fi

    # Cloud9 default prompt
    _cloud9_prompt_user() {
        if [ "$C9_USER" = root ]; then
            echo "$USER"
        else
            echo "$C9_USER"
        fi
    }

    PS1='\[\033[01;32m\]$(_cloud9_prompt_user)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)" 2>/dev/null) $ '
fi

EOF

    chown "$UNIX_USER":"$UNIX_GROUP" "$UNIX_USER_HOME"/.bashrc
fi

if [ "$ENVIRONMENT_PATH" == "/home/ec2-user/environment" ] && [ ! -f "$ENVIRONMENT_PATH"/README.md ]; then
    cat <<'EOF' >> "$ENVIRONMENT_PATH"/README.md
         ___        ______     ____ _                 _  ___
        / \ \      / / ___|   / ___| | ___  _   _  __| |/ _ \
       / _ \ \ /\ / /\___ \  | |   | |/ _ \| | | |/ _` | (_) |
      / ___ \ V  V /  ___) | | |___| | (_) | |_| | (_| |\__, |
     /_/   \_\_/\_/  |____/   \____|_|\___/ \__,_|\__,_|  /_/
 -----------------------------------------------------------------


Hi there! Welcome to AWS Cloud9!

To get started, create some files, play with the terminal,
or visit https://docs.aws.amazon.com/console/cloud9/ for our documentation.

Happy coding!

EOF

    chown "$UNIX_USER":"$UNIX_GROUP" "$UNIX_USER_HOME"/environment/README.md
fi

# Fix for permission error when trying to call `gem install`
chown "$UNIX_USER" -R /usr/local/rvm/gems

#This script is appended to another bash script, so it does not need a bash script file header.

UNIX_USER_HOME="/home/ubuntu"

C9_DIR=$UNIX_USER_HOME/.c9
CONFIG_FILE_PATH="$C9_DIR"/autoshutdown-configuration
VFS_CHECK_FILE_PATH="$C9_DIR"/stop-if-inactive.sh

echo "SHUTDOWN_TIMEOUT=30" > "$CONFIG_FILE_PATH"
chmod a+w "$CONFIG_FILE_PATH"

echo -e '#!/bin/bash
set -euo pipefail
CONFIG=$(cat '$CONFIG_FILE_PATH')
SHUTDOWN_TIMEOUT=${CONFIG#*=}
if ! [[ $SHUTDOWN_TIMEOUT =~ ^[0-9]*$ ]]; then
    echo "shutdown timeout is invalid"
    exit 1
fi
is_shutting_down() {
    is_shutting_down_ubuntu &> /dev/null || is_shutting_down_al1 &> /dev/null || is_shutting_down_al2 &> /dev/null
}
is_shutting_down_ubuntu() {
    local TIMEOUT
    TIMEOUT=$(busctl get-property org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager ScheduledShutdown)
    if [ "$?" -ne "0" ]; then
        return 1
    fi
    if [ "$(echo $TIMEOUT | awk "{print \$3}")" == "0" ]; then
        return 1
    else
        return 0
    fi
}
is_shutting_down_al1() {
    pgrep shutdown
}
is_shutting_down_al2() {
    local FILE
    FILE=/run/systemd/shutdown/scheduled
    if [[ -f "$FILE" ]]; then
        return 0
    else
        return 1
    fi
}
is_vfs_connected() {
    pgrep -f vfs-worker >/dev/null
}

if is_shutting_down; then
    if [[ ! $SHUTDOWN_TIMEOUT =~ ^[0-9]+$ ]] || is_vfs_connected; then
        sudo shutdown -c
    fi
else
    if [[ $SHUTDOWN_TIMEOUT =~ ^[0-9]+$ ]] && ! is_vfs_connected; then
        sudo shutdown -h $SHUTDOWN_TIMEOUT
    fi
fi' > "$VFS_CHECK_FILE_PATH"

chmod +x "$VFS_CHECK_FILE_PATH"

echo "* * * * * root $VFS_CHECK_FILE_PATH" > /etc/cron.d/c9-automatic-shutdown

facterversion => 3.14.23
filesystems => btrfs,ext2,ext3,ext4,squashfs,vfat
fips_enabled => false
hypervisors => {
  kvm => {}
}
identity => {
  gid => 1000,
  group => "ubuntu",
  privileged => false,
  uid => 1000,
  user => "ubuntu"
}
is_virtual => true
kernel => Linux
kernelmajversion => 5.4
kernelrelease => 5.4.0-1072-aws
kernelversion => 5.4.0
load_averages => {
  15m => 0,
  1m => 0.08,
  5m => 0.03
}
memory => {
  swap => {
    available => "488.28 MiB",
    available_bytes => 511995904,
    capacity => "0%",
    total => "488.28 MiB",
    total_bytes => 511995904,
    used => "0 bytes",
    used_bytes => 0
  },
  system => {
    available => "5.17 GiB",
    available_bytes => 5554532352,
    capacity => "32.57%",
    total => "7.67 GiB",
    total_bytes => 8237813760,
    used => "2.50 GiB",
    used_bytes => 2683281408
  }
}
mountpoints => {
  / => {
    available => "3.26 GiB",
    available_bytes => 3498491904,
    capacity => "66.11%",
    device => "/dev/nvme0n1p1",
    filesystem => "ext4",
    options => [
      "rw",
      "relatime",
      "discard"
    ],
    size => "9.63 GiB",
    size_bytes => 10340794368,
    used => "6.36 GiB",
    used_bytes => 6825525248
  },
  /dev => {
    available => "3.82 GiB",
    available_bytes => 4104011776,
    capacity => "0%",
    device => "udev",
    filesystem => "devtmpfs",
    options => [
      "rw",
      "nosuid",
      "relatime",
      "size=4007824k",
      "nr_inodes=1001956",
      "mode=755"
    ],
    size => "3.82 GiB",
    size_bytes => 4104011776,
    used => "0 bytes",
    used_bytes => 0
  },
  /dev/hugepages => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "hugetlbfs",
    filesystem => "hugetlbfs",
    options => [
      "rw",
      "relatime",
      "pagesize=2M"
    ],
    size => "0 bytes",
    size_bytes => 0,
    used => "0 bytes",
    used_bytes => 0
  },
  /dev/mqueue => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "mqueue",
    filesystem => "mqueue",
    options => [
      "rw",
      "relatime"
    ],
    size => "0 bytes",
    size_bytes => 0,
    used => "0 bytes",
    used_bytes => 0
  },
  /dev/pts => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "devpts",
    filesystem => "devpts",
    options => [
      "rw",
      "nosuid",
      "noexec",
      "relatime",
      "gid=5",
      "mode=620",
      "ptmxmode=000"
    ],
    size => "0 bytes",
    size_bytes => 0,
    used => "0 bytes",
    used_bytes => 0
  },
  /dev/shm => {
    available => "3.84 GiB",
    available_bytes => 4118904832,
    capacity => "0%",
    device => "tmpfs",
    filesystem => "tmpfs",
    options => [
      "rw",
      "nosuid",
      "nodev"
    ],
    size => "3.84 GiB",
    size_bytes => 4118904832,
    used => "0 bytes",
    used_bytes => 0
  },
  /run => {
    available => "784.82 MiB",
    available_bytes => 822947840,
    capacity => "0.10%",
    device => "tmpfs",
    filesystem => "tmpfs",
    options => [
      "rw",
      "nosuid",
      "noexec",
      "relatime",
      "size=804476k",
      "mode=755"
    ],
    size => "785.62 MiB",
    size_bytes => 823783424,
    used => "816.00 KiB",
    used_bytes => 835584
  },
  /run/lock => {
    available => "5.00 MiB",
    available_bytes => 5242880,
    capacity => "0%",
    device => "tmpfs",
    filesystem => "tmpfs",
    options => [
      "rw",
      "nosuid",
      "nodev",
      "noexec",
      "relatime",
      "size=5120k"
    ],
    size => "5.00 MiB",
    size_bytes => 5242880,
    used => "0 bytes",
    used_bytes => 0
  },
  /run/user/1000 => {
    available => "785.62 MiB",
    available_bytes => 823779328,
    capacity => "0%",
    device => "tmpfs",
    filesystem => "tmpfs",
    options => [
      "rw",
      "nosuid",
      "nodev",
      "relatime",
      "size=804472k",
      "mode=700",
      "uid=1000",
      "gid=1000"
    ],
    size => "785.62 MiB",
    size_bytes => 823779328,
    used => "0 bytes",
    used_bytes => 0
  },
  /snap/amazon-ssm-agent/5163 => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "/dev/loop2",
    filesystem => "squashfs",
    options => [
      "ro",
      "nodev",
      "relatime"
    ],
    size => "26.75 MiB",
    size_bytes => 28049408,
    used => "26.75 MiB",
    used_bytes => 28049408
  },
  /snap/core18/2344 => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "/dev/loop1",
    filesystem => "squashfs",
    options => [
      "ro",
      "nodev",
      "relatime"
    ],
    size => "55.63 MiB",
    size_bytes => 58327040,
    used => "55.63 MiB",
    used_bytes => 58327040
  },
  /snap/core18/2409 => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "/dev/loop0",
    filesystem => "squashfs",
    options => [
      "ro",
      "nodev",
      "relatime"
    ],
    size => "55.63 MiB",
    size_bytes => 58327040,
    used => "55.63 MiB",
    used_bytes => 58327040
  },
  /snap/snapd/15177 => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "/dev/loop3",
    filesystem => "squashfs",
    options => [
      "ro",
      "nodev",
      "relatime"
    ],
    size => "43.75 MiB",
    size_bytes => 45875200,
    used => "43.75 MiB",
    used_bytes => 45875200
  },
  /snap/snapd/15534 => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "/dev/loop4",
    filesystem => "squashfs",
    options => [
      "ro",
      "nodev",
      "relatime"
    ],
    size => "44.75 MiB",
    size_bytes => 46923776,
    used => "44.75 MiB",
    used_bytes => 46923776
  },
  /sys/fs/cgroup => {
    available => "3.84 GiB",
    available_bytes => 4118904832,
    capacity => "0%",
    device => "tmpfs",
    filesystem => "tmpfs",
    options => [
      "ro",
      "nosuid",
      "nodev",
      "noexec",
      "mode=755"
    ],
    size => "3.84 GiB",
    size_bytes => 4118904832,
    used => "0 bytes",
    used_bytes => 0
  },
  /var/lib/lxcfs => {
    available => "0 bytes",
    available_bytes => 0,
    capacity => "100%",
    device => "lxcfs",
    filesystem => "fuse.lxcfs",
    options => [
      "rw",
      "nosuid",
      "nodev",
      "relatime",
      "user_id=0",
      "group_id=0",
      "allow_other"
    ],
    size => "0 bytes",
    size_bytes => 0,
    used => "0 bytes",
    used_bytes => 0
  }
}
networking => {
  dhcp => "172.31.0.1",
  domain => "eu-west-1.compute.internal",
  fqdn => "ip-172-31-12-98.eu-west-1.compute.internal",
  hostname => "ip-172-31-12-98",
  interfaces => {
    docker0 => {
      bindings => [
        {
          address => "172.17.0.1",
          netmask => "255.255.0.0",
          network => "172.17.0.0"
        }
      ],
      ip => "172.17.0.1",
      mac => "02:42:a8:1b:19:b1",
      mtu => 1500,
      netmask => "255.255.0.0",
      network => "172.17.0.0"
    },
    ens5 => {
      bindings => [
        {
          address => "172.31.12.98",
          netmask => "255.255.240.0",
          network => "172.31.0.0"
        }
      ],
      bindings6 => [
        {
          address => "fe80::6c:ceff:fe5c:9bd9",
          netmask => "ffff:ffff:ffff:ffff::",
          network => "fe80::"
        }
      ],
      dhcp => "172.31.0.1",
      ip => "172.31.12.98",
      ip6 => "fe80::6c:ceff:fe5c:9bd9",
      mac => "02:6c:ce:5c:9b:d9",
      mtu => 9001,
      netmask => "255.255.240.0",
      netmask6 => "ffff:ffff:ffff:ffff::",
      network => "172.31.0.0",
      network6 => "fe80::",
      scope6 => "link"
    },
    lo => {
      bindings => [
        {
          address => "127.0.0.1",
          netmask => "255.0.0.0",
          network => "127.0.0.0"
        }
      ],
      bindings6 => [
        {
          address => "::1",
          netmask => "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff",
          network => "::1"
        }
      ],
      ip => "127.0.0.1",
      ip6 => "::1",
      mtu => 65536,
      netmask => "255.0.0.0",
      netmask6 => "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff",
      network => "127.0.0.0",
      network6 => "::1",
      scope6 => "host"
    }
  },
  ip => "172.31.12.98",
  ip6 => "fe80::6c:ceff:fe5c:9bd9",
  mac => "02:6c:ce:5c:9b:d9",
  mtu => 9001,
  netmask => "255.255.240.0",
  netmask6 => "ffff:ffff:ffff:ffff::",
  network => "172.31.0.0",
  network6 => "fe80::",
  primary => "ens5",
  scope6 => "link"
}
os => {
  architecture => "amd64",
  distro => {
    codename => "bionic",
    description => "Ubuntu 18.04.6 LTS",
    id => "Ubuntu",
    release => {
      full => "18.04",
      major => "18.04"
    }
  },
  family => "Debian",
  hardware => "x86_64",
  name => "Ubuntu",
  release => {
    full => "18.04",
    major => "18.04"
  },
  selinux => {
    enabled => false
  }
}
partitions => {
  /dev/loop0 => {
    backing_file => "/var/lib/snapd/snaps/core18_2409.snap",
    mount => "/snap/core18/2409",
    size => "55.54 MiB",
    size_bytes => 58232832
  },
  /dev/loop1 => {
    backing_file => "/var/lib/snapd/snaps/core18_2344.snap",
    mount => "/snap/core18/2344",
    size => "55.52 MiB",
    size_bytes => 58212352
  },
  /dev/loop2 => {
    backing_file => "/var/lib/snapd/snaps/amazon-ssm-agent_5163.snap",
    mount => "/snap/amazon-ssm-agent/5163",
    size => "26.64 MiB",
    size_bytes => 27930624
  },
  /dev/loop3 => {
    backing_file => "/var/lib/snapd/snaps/snapd_15177.snap",
    mount => "/snap/snapd/15177",
    size => "43.63 MiB",
    size_bytes => 45748224
  },
  /dev/loop4 => {
    backing_file => "/var/lib/snapd/snaps/snapd_15534.snap",
    mount => "/snap/snapd/15534",
    size => "44.68 MiB",
    size_bytes => 46845952
  },
  /dev/nvme0n1p1 => {
    mount => "/",
    size => "10.00 GiB",
    size_bytes => 10736352768
  }
}
path => /home/ubuntu/.rvm/gems/ruby-2.6.3/bin:/home/ubuntu/.rvm/gems/ruby-2.6.3@global/bin:/home/ubuntu/.rvm/rubies/ruby-2.6.3/bin:/home/ubuntu/.nvm/versions/node/v16.15.0/bin:/home/ubuntu/.rvm/gems/ruby-2.6.3/bin:/home/ubuntu/.rvm/gems/ruby-2.6.3@global/bin:/home/ubuntu/.rvm/rubies/ruby-2.6.3/bin:/home/ubuntu/.rvm/gems/ruby-2.6.3/bin:/home/ubuntu/.rvm/gems/ruby-2.6.3@global/bin:/home/ubuntu/.rvm/rubies/ruby-2.6.3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ubuntu/.local/bin:/home/ubuntu/bin:/usr/local/bin:/home/ubuntu/.rvm/bin:/opt/puppetlabs/bin:/home/ubuntu/.local/bin:/home/ubuntu/bin:/usr/local/bin:/home/ubuntu/.rvm/bin:/home/ubuntu/.rvm/bin:/home/ubuntu/.local/bin:/home/ubuntu/bin:/usr/local/bin:/home/ubuntu/.rvm/bin:/home/ubuntu/.rvm/bin
processors => {
  count => 2,
  isa => "x86_64",
  models => [
    "Intel(R) Xeon(R) Platinum 8259CL CPU @ 2.50GHz",
    "Intel(R) Xeon(R) Platinum 8259CL CPU @ 2.50GHz"
  ],
  physicalcount => 1
}
ruby => {
  platform => "x86_64-linux",
  sitedir => "/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.5.0",
  version => "2.5.9"
}
ssh => {
  dsa => {
    fingerprints => {
      sha1 => "SSHFP 2 1 203e74027b9735e76bf1c586ef5e12bf981d4583",
      sha256 => "SSHFP 2 2 a4d7b6d31002be768e5c91393ac358062a658738d130f22a57ddced5231ad046"
    },
    key => "AAAAB3NzaC1kc3MAAACBALAun2sDS7jMh53v49jPGG4ms2yIAExEBmqOr48bdTmf62z/51IIoPzOsHn6h40BGjm90/v3bXQR1RbnMjfDTg6Lp7WrrztUergaRobBKSSMOG4F10mrct7+aKCkhnv+dTxBokRQ6TQGKu5frPXbdd4djeNKScnkt3XFnRqxrJrDAAAAFQDwAq1LdNWC1Vyt4goyIQ2mvqa/QwAAAIByehx7+9g5m3ImgcspVCgdiyZNnPrkMD8Prx0+DyybkigSR5LxLojy5MTjjJ8woPkrwKStHhjv+IGERfX+2oX7CtbRQfRRvrgElBbqCl8QC6c0ZI4+6c3KJ3+E2Vi54Qmz0PC9UKv44Z1UWloXLHBtcOxDwp5vVCwIGJd8SXA1OQAAAIA7Iy6stbyxpv1GbA0tYTKjixE2ClWgDsFtA0619//8aiuK2vQ2wB7GoZu3TR2PFYmd9KuCjbG6cUgS3yvFJJCGlku1H3Sn0QhQFKwwFhU0v8Ka3+UVgjECyjbnIBc+NuNr1VVu3hYrBMrZQ3vOnMJSXkcaBw9KJAC3Lahv9dk+hA==",
    type => "ssh-dss"
  },
  ecdsa => {
    fingerprints => {
      sha1 => "SSHFP 3 1 1b8282ccae20dad2fe05ace73d911684af8b808c",
      sha256 => "SSHFP 3 2 ac1d4a8d32236e1b1bfb251526602039b8224a5c6c1df72d8aba05bb8bb9343f"
    },
    key => "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFDJ1wabi3JbaSnWTNxWi/DTw7KDUbGoy3wi/1N5ikIBJdav5lWMuK0A4vq8j2NRVfmFcGNefSEvyhw2nW3XsRk=",
    type => "ecdsa-sha2-nistp256"
  },
  ed25519 => {
    fingerprints => {
      sha1 => "SSHFP 4 1 537b06f07b5f4aa2b48a07c36ae093f5dd5adc97",
      sha256 => "SSHFP 4 2 b589dc106fe436daf0492e0d5e1394c32440aaaf77290b7aa823aac6bc59a0cc"
    },
    key => "AAAAC3NzaC1lZDI1NTE5AAAAIDKyDSYjdbn4G5NYZLu3nJZ/LzE0JxJs7+oLMzwt23Ac",
    type => "ssh-ed25519"
  },
  rsa => {
    fingerprints => {
      sha1 => "SSHFP 1 1 f0c21911664c27198c147ad7cfd5eb1fb0e75e02",
      sha256 => "SSHFP 1 2 608c2c773757edd9b76b21cea1bbb340667864a4f57358aba4fdb54b86468a9b"
    },
    key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDTqDah9e1JxIf8CZYvNGi5Y0QLscFsNaU/BgwRCmQxxiAn9RsGLvOy/HXzfDHhGoyb51+VMSFVdjrW018gwvzj330v+crhlPjulQWlblJ++NArH5LwK70rj4Vele/YgxAB7B70Mrh2bFK+hiAtued63DrlongaqpP3hf7AIQw36aF754TxfUNO1xDFP9HhCVmJiJY0IjNxD+7EH96cKHqP8zhZqtvuOCeeVmBZrp2mjg87S09xqROR3ZQ7HyWbxxapefULubA/VFEGmw9jVP4FBEcK3cn7w9BtOa+k4H1poXpVJLB+//BS6y/h9wZEIWqZviY02UWH6YbarR1YHHvb",
    type => "ssh-rsa"
  }
}
system_uptime => {
  days => 0,
  hours => 7,
  seconds => 27215,
  uptime => "7:33 hours"
}
timezone => UTC
virtual => kvm

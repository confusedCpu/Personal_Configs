#!/usr/bin/env python3

"""
TODO - Add to default bashrc, so all users will execute at login
"""

from datetime import datetime
import os
import re
from subprocess import check_output
import sys
import platform

###############################################################################
### Global Vars
###############################################################################

# regex to filter out non ad groups ie. OSX builtins
_pattern = r'\d+\(RAMS\\(?P<ad_group>.*)\)' if platform.system() == 'Darwin' else r'\d+\((?P<ad_group>.*)@RAMS.adp.vcu.edu\)'
_regex = re.compile(_pattern)

# ad_group -> directory_name -> directory_path
_mappings = {
    'SAF Commons Drive Mappings': {
        'DSAESWEB01 USCA': "//dsaesweb01/USCA",
        'USC&A Apps': "//sasemdata.rams.adp.vcu.edu/Commons_and_Activities/apps",
        # TODO Security Issue
        'Directors': "//sasemdata.rams.adp.vcu.edu/dean/public/directors",
        'Fraternity & Sorority Life': "//sasemdata.rams.adp.vcu.edu/Commons)and_Activities/Public/Programs and Educational Services/Fraternity and Sorority Life",
        'DSA FSC': "//sasemdata.rams.adp.vcu.edu/volume/DSA FSC/Public",
    },
    'SAF Publish Drive Mappings': {},
    'SAF Counseling Drive Mappings': {
        ''
    },
    'SAF TSS Drive Mappings': {
        'Safpub': "//sasemdata.rams.adp.vcu.edu/safpub",
        'Techpub': "//sasemdata.rams.adp.vcu.edu/tech/public",
        'EES': "//uccisilon.rams.adp.vcu.edu/TS/EES"
    }
}

_debug: bool = True if sys.argv.__contains__("--debug") or sys.argv.__contains__('-d') else False
_user: str = os.environ['USER']
_home: str = os.environ['HOME']
_mnt: str = "{}/mnt".format(_home)
_log: str = "{}/.automount.log".format(_home)
_mnt_cmd: list = ['mount_smbfs'] if platform.system() == 'Darwin' else ['sudo', 'mount.cifs']

# end Global Vars
###############################################################################


###############################################################################
# Functions
###############################################################################

# logs actions made by the script and echos them to STDOUT if debug is set
def log( msg: str, log: str = _log ):
    dt = datetime.now().strftime("%m/%d/%Y %H:%M:%S")
    msg = "[{}] {}".format(dt, msg)
    with open(log, mode="a+") as lf:
        lf.write(msg)

    if _debug:
        print(msg)
# end log

# end functions
###############################################################################


# Get output from the shell command 'id' and convert it to list
id_output: list = check_output(['id']).decode("utf-8").split(',')
groups: list = []

# Collect applicable groups
msg = "Groups Found: \n"
for i in id_output:
    match = _regex.match(i)
    if match:
        m = match.group('ad_group')
        #groups.append(match.group('ad_group').strip())
        groups.append(m)
        msg += "\t{}\n".format(m)

# Check if an groups were found
if groups.count != 0:
    log(msg)
else:
    log("Error - No applicable groups found")

# Create user mont dir
if not os.path.isdir(_mnt):
    #ec = check_output(['mkdir', _mnt]).decode("utf-8")
    os.mkdir(_mnt)
    if _debug:
        log("Made mount dir at {}".format(_mnt))
        #print("[DEBUG] Command: mkdir {} || Exit Code: {}".format(_mnt, ec))

# Attempt to mount the drives
for g in groups:
    if g in _mappings.keys():
        for name, uri in _mappings.get(g).items():

            mount_point = "{}/{}".format(_mnt, name)
            log('Attempting to mount {} -> {}'.format(uri, mount_point))

            try:
                # Create the mountpoint
                if not os.path.isdir(mount_point):
                    os.mkdir(mount_point)
                    log("Directory created at {}".format(mount_point))
                # Mount the dir
                ec = check_output(_mnt_cmd + [uri, mount_point]).decode('utf-8')
                log("Successfully mounted {} -> {}".format(uri, mount_point))

            except Exception as e:
                log("Failed to mount {}: {}".format(uri, e))

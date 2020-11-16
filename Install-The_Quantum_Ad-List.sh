#!/bin/bash
#############################################################
#############################################################
##                                                         ##
##      Thank you for choosing The Quantum Ad-List!        ##
##             We hope you will be satisfied!              ##
##              ---------------------------                ##
##                 By The Quantum Alpha                    ##
##    Reddit: https://reddit.com/user/The_Quantum_Alpha    ##
##         MeWe: https://mewe.com/join/TechnoChat          ##
##                                                         ##
##                                                         ##
##   You may please run this script with root privilege!   ##
##                                                         ##
#############################################################
#############################################################

set -o pipefail
set -o nounset
set -o errexit

DIR="$(cd "$(dirname "$0")"; pwd)"

HOSTNAME="${HOSTNAME-"$(uname -n)"}"
HEADER="$(cat <<-EOF
	127.0.0.1       localhost ${HOSTNAME?}
	255.255.255.255 broadcasthost
	::1             localhost ${HOSTNAME?}
	::1             ip6-localhost ip6-loopback
	fe00::0         ip6-localnet
	ff00::0         ip6-mcastprefix
	ff02::1         ip6-allnodes
	ff02::2         ip6-allrouters
	ff02::3         ip6-allhosts
	
EOF
)"

LE_ADS=(
    'https://gitlab.com/The_Quantum_Alpha/the-quantum-ad-list/-/raw/master/For%20hosts%20file/The_Quantum_Ad-List.txt'
)


GETLIST="$(for site in ${LE_ADS[@]}; do
    curl "${site}" > "${DIR}/TQAL.hosts"
done
)"

LIST="$(cat "${DIR}/TQAL.hosts")"

YEETED="$(cat <<-EOF
	${HEADER?}
	${LIST?}
EOF
)"

echo "${YEETED}" > /etc/hosts

rm "${DIR}/TQAL.hosts"

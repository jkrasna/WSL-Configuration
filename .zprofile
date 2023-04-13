PROFD_DIR="/etc/profile.d"

if [[ -f "$PROFD_DIR/epics.sh" ]]; then
	. $PROFD_DIR/epics.sh
fi

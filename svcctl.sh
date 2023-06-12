#!/bin/bash

# Environment Setup Functions

# systemctl wrappers
function svcctl() {
	case $1 in
		e|edit)
			sudo nano /etc/systemd/system/$2.service
		;;
		q|stop)
			sudo systemctl stop $2.service
		;;
		r|run)
			sudo systemctl start $2.service
		;;
		d|disable)
			sudo systemctl disable $2.service
		;;
		s|status)
			sudo systemctl status $2.service
		;;
		dr|reload)
			sudo systemctl daemon-reload
		;;
		l|logs)
			journalctl -u $2.service -f
		;;
		h|help)
		        echo "svcctl: A simple command to make your systemctl commands shorter and less annoying"
		        echo ""
		        echo "To begin, the following commands are currently supported:"
		        echo "svcctl [OPTIONS] [SERVICE NAME]"
		        echo "    e | edit    - To edit service file in /etc/systemd/system"
		        echo "    q | stop    - To stop a service"
		        echo "    r | run     - To run a service"
		        echo "    d | disable - To disable a service"
		        echo "    s | status  - To view service status"
		        echo "   dr | reload  - To reload systemd daemon"
		        echo "    h | help    - To view this help page"
			echo "    l | logs    - To view logs for a particular service, live"
		        echo "For misc issues, please email gagan@luganodes.com"
		;;
	esac
}

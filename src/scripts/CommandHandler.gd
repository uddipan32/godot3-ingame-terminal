class_name CommandHandler
#extends RefCounted

var command_list = ["ifconfig", "ls", "pwd"]
var command_json = {
					"ls":"Desktop \t Documents \t Downloads \t Public \t Videos",
					"pwd":"/home/ubuntu",
					"ifconfig":  "cali8a6670e8646: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500 \n" +  \
		 "\t\tinet6 fe80::fcee:efff:feee:eeee  prefixlen 64  scopeid 0x20<link> \n" + \
		"\t\tether ee:ee:ee:ee:ee:ee  txqueuelen 0  (Ethernet) \n" + \
		"\t\tRX packets 913628  bytes 79389183 (79.3 MB)\n" + \
		"\t\tRX errors 0  dropped 1  overruns 0  frame 0\n" + \
		"\t\tTX packets 892112  bytes 386799798 (386.7 MB)\n" + \
		"\t\tTX errors 0  dropped 0 overruns 0  carrier 0  collisions 0 \n\n" + \
"enp14s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500  \n" + \
		"\t\tinet 10.0.0.3  netmask 255.255.255.0  broadcast 10.0.0.255\n" + \
		"\t\tinet6 fe50::2e07:51ff:fe1d:65e2  prefixlen 64  scopeid 0x20<link>\n" + \
		"\t\tether 3c:07:71:1d:61:e1  txqueuelen 1000  (Ethernet)\n" + \
		"\t\tRX packets 723899078  bytes 1144145964128 (1.1 TB)\n" + \
		"\t\tRX errors 0  dropped 3558  overruns 0  frame 0\n" + \
		"\t\tTX packets 213817352  bytes 16132104645 (16.1 GB)\n" + \
		"\t\tTX errors 1  dropped 0 overruns 0  carrier 0  collisions 0\n\n" + \
"lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536\n" + \
		"\t\tinet 127.0.0.1  netmask 255.0.0.0\n" + \
		"\t\tinet6 ::1  prefixlen 128  scopeid 0x10<host>\n" + \
		"\t\tloop  txqueuelen 1000  (Local Loopback)\n" + \
		"\t\tRX packets 593151873  bytes 168017963250 (168.0 GB)\n" + \
		"\t\tRX errors 0  dropped 0  overruns 0  frame 0\n" + \
		"\t\tTX packets 593151873  bytes 168017963250 (168.0 GB)\n" + \
		"\t\tTX errors 0  dropped 0 overruns 0  carrier 0  collisions 0\n\n" + \
"vxlan.calico: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1450\n" + \
		"\t\tinet 10.0.0.4  netmask 255.255.255.255  broadcast 0.0.0.0\n" + \
		"\t\tinet6 fe80::64f5:3dff:fe2e:2ea1  prefixlen 64  scopeid 0x20<link>\n" + \
		"\t\tether 66:f5:3d:2e:2e:a1  txqueuelen 0  (Ethernet)\n" + \
		"\t\tRX packets 0  bytes 0 (0.0 B)\n" + \
		"\t\tRX errors 0  dropped 0  overruns 0  frame 0\n" + \
		"\t\tTX packets 0  bytes 0 (0.0 B)\n" + \
		"\t\tTX errors 0  dropped 6141 overruns 0  carrier 0  collisions 0" }
#func _init(command):
#	self.command_list = command_list
#	self.validate_command(command)
	
func validate_command(command):
	var output = ""
	var command_name = command.split(" ")[0]
	if command_name in self.command_list:
		output = str(command_json[command_name]) + "\n"
	else:
		output = "Command "+command+" doesn't exist\n"
	
	return output

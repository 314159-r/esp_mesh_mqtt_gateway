# EspNow2mqtt
![](logo.png) ![](images/home-assistant-logo.png)
#### - Home Assistant Add-on
#### - MQTT gateway for EspNow Flooding Mesh wireless devices (esp8266 or esp32)
----
This is a fork of https://github.com/leodesigner/esp_mesh_mqtt_gateway \
adapted to be installed as a Home Assistant Add-on.

It can run as a HA Add-on, or stand-alone, on the RaspberryPI, OrangePI or any capable machine.

### Install as Home Assistant Add-on
- Install and configure Samba or SSH Add-ons
- Create the folder: `/addons/espnow2mqtt`
- Copy the files from here into that folder
- In HA, open the "Add-on store"
- On the top right overflow menu, click the "Check for updates" button
- You should now see a new section at the top of the store called "Local add-ons"
- Install it, open it, and go to the "Configuration" tab
- Edit your configuration, save and (re)start

<details>
<summary>List of files required</summary>

```config.yaml
Dockerfile
gateway.py
icon.png
logo.png
requirements.txt
run.sh
```
</details>

Moore details in Home Assistant docs: [Tutorial: Making your first add-on](https://developers.home-assistant.io/docs/add-ons/tutorial)

Currently, there is no implementation of the `stats_listener.py` script in this Add-on.

### Running stand-alone
- Clone or download the files to a suitable folder
- Rename the configuration file: `gw-config-template.json` to: `gw-config.json` 
- Edit the configuration
- Create a Python venv in that folder: `python3 -m venv venv`
- Activate the venv:  `source venv/bin/activate`
- Install the requirements: `pip install -r requirements.txt`
- Deactivate the venv: `deactivate`
- Start the gateway: `./start.sh`

gateway.py \
Gateway that connects to mqtt broker and relay messages between EspNow mesh network and MQTT.

stats_listener.py \
Collects and displays node stats, listen to mesh mqtt messages, stores nodes names & mac_addr.

### Usage

This gateway is intended to be used togeather with a esp8266/esp32 EspNow master/gateway node: \
https://github.com/leodesigner/esp_mesh_gw_node by [leodesigner](https://github.com/leodesigner) \
It should be connected via usb to the host running these scripts.

Mesh node example by [leodesigner](https://github.com/leodesigner): https://github.com/leodesigner/esp_mesh_pir_sensor

-- https://steamdecki.org/Steam_Deck/Wireless/Bluetooth#Enabling_More_Codecs_and_Enabling_Headsets
bluez_monitor.properties = {
	["bluez5.enable-sbc-xq"] = true,
	["bluez5.enable-msbc"] = true,
	--["bluez5.codecs"] = "[sbc sbc_xq aac ldac aptx aptx_hd aptx_ll aptx_ll_duplex faststream faststream_duplex]",
	["bluez5.codecs"] = "[aptx_hd aptx_11 aptx_11_duplex sbc_xq]",
}

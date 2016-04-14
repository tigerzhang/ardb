--[[   --]]
ardb.call("del", "mygeo")
local s = ardb.call("geoadd", "mygeo", "13.361389", "38.115556", "Palermo", "15.087269", "37.502669", "Catania")
ardb.assert2(s == 2, s)
s = ardb.call("geodist", "mygeo", "Palermo", "Catania")
ardb.assert2(s == "166274.1510", s)
s = ardb.call("geohash", "mygeo", "Palermo", "Catania")
ardb.assert2(s[1] == "sqc8b49rny0", s)
ardb.assert2(s[2] == "sqdtr74hyu0", s)
s = ardb.call("GEORADIUS", "mygeo", "15", "37", "100", "km", "withdist", "WITHCOORD")
ardb.assert2(s[1][1] == "Catania", s[1])
ardb.assert2(s[1][2] == "56.4413", s[1])
ardb.assert2(s[1][3][1] == "15.087267458438873", s[1][3])
ardb.assert2(s[1][3][2] == "37.502668961281628", s[1][3])
s = ardb.call("GEORADIUS", "mygeo", "15", "37", "200", "km")
ardb.assert2(s[1] == "Palermo", s)
ardb.assert2(s[2] == "Catania", s)
ardb.call("geoadd", "mygeo", "13.583333", "37.316667", "Agrigento")
s = ardb.call("GEORADIUSBYMEMBER", "mygeo", "Agrigento", "100", "km")
ardb.assert2(s[1] == "Agrigento", s)
ardb.assert2(s[2] == "Palermo", s)
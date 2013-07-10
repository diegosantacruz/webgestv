# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Serv.delete_all
NetEle.delete_all
LaynetEle.delete_all
McrAtr.delete_all
Atr.delete_all
Hst.delete_all
Alrt.delete_all
  i=1
  conn1= Conn.new(ip: "1.1.1.#{i}", port: i)
  netele = NetEle.create(name: "n#{i}", domain:'SNMPServerIntegration', desc: "network element #{i}")
  netele.conn=conn1
  conn2=Conn.new(ip: "1.1.1.#{i}", port: 100+i)
  serv=Serv.create(name:"s#{i}",  domain: netele.name, desc: "service #{i}", mother: netele._id)
  serv.conn=conn2
  ma=McrAtr.create(name:"ma#{i}", desc: "macro attribute #{i}", tipo: "composite")
  serv.mcr_atrs << ma

  (1..3).each do |i|
  a1=Atr.create(name:"a#{i}", desc: "attribute #{i}", tipo: "integer")
  ma.atrs << a1
  end  

  atrs=ma.atrs
  (1..5).each do |i|
  time= Time.now.to_i + i
  h1=Hst.create(value:"#{i*10}", tstamp: time )
  atrs[0].hsts << h1
  h2=Hst.create(value:"#{i*15}", tstamp: time )
  atrs[1].hsts << h2
  h3=Hst.create(value:"A#{i}", tstamp: time )
  atrs[2].hsts << h3
  end


# a1=Atr.create(name:"a#{i}", desc: "attribute #{i}", tipo: "integer")
#  ma.atrs << a1




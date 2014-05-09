# -*- coding: utf-8 -*-
require 'rss'
require 'date'
require 'time'


websites = ['http://d.hatena.ne.jp/Kango/rss',
			'http://www.st.ryukoku.ac.jp/~kjm/security/memo/memo.rdf',
			'http://feeds.trendmicro.com/TM-Securityblog/',
			'http://www.ipa.go.jp/security/rss/alert.rdf',
			'http://www.jpcert.or.jp/rss/jpcert.rdf',
			'http://jvn.jp/rss/jvn.rdf',
			'http://securityblog.jp/index.rdf',
			'http://jprs.jp/tech/jprs-dnstech.rdf',
			'http://blogs.mcafee.com/category/mcafee-labs/feed?cat=442',
			'http://blogs.securiteam.com/index.php/feed',
			'http://blog.beyondtrust.com/feed?post_type=post',
#			'http://www.fireeye.com/blog/feed',
			'http://blog.f-secure.jp/index.rdf',
			'http://itpro.nikkeibp.co.jp/rss/security.rdf',
			'http://jvnrss.ise.chuo-u.ac.jp/csn/rss/index.rdf',
			'http://yamagata.int21h.jp/d/index.rdf',
			'http://rss.packetstormsecurity.com/',
			'http://www.exploit-db.com/rss.xml',
			'http://news.netcraft.com/feed/',
			'http://blogs.msdn.com/b/ie_jp/rss.aspx',
			'http://krebsonsecurity.com/feed/',
			'http://d.hatena.ne.jp/ripjyr/rss',
			'http://d.hatena.ne.jp/hasegawayosuke/rss',
			'http://blogs.technet.com/b/msrc/rss.aspx',
			'http://takagi-hiromitsu.jp/diary/index.rdf',
			'http://www.netagent-blog.jp/index.rdf',
			'http://motivate.jp/feed',
			'http://www.us-cert.gov/ncas/current-activity.xml']


#			'http://www.rbl.jp/phishing/rss/rss1.0.rdf']
#			'http://isc.sans.edu/rssfeed.xml']
#websites_atom = ['http://blog.watchfire.com/wfblog/rss.xml']
#websites_atom = ['http://secunia.com/blog_rss/blog.rss']


# Util
today = Date.today


# Main
websites.each do |url|
	rss = RSS::Parser.parse(url)
	print "+\\t#{rss.channel.title.strip}\\t#{rss.channel.link.strip}\n"
	i = 0
	rss.items.each do |item|
		date_a = Date.parse("#{item.date}")
		if date_a < today - 14 then
			next
		end

 		print "#{item.link.strip}\\t"
  		print "#{item.title.gsub(/[\r\n]/,'')}\\t"
		if item.description != nil then
	  		print "#{item.description.gsub(/[\r\n]/, '')}\\t"
		else
			print "\\t"
		end

		if today < date_a + 3 then
			print "<font color='red'><b>#{date_a}</b></font>\n"
		else
  			print "#{date_a}\n"
		end
		i += 1
		if i > 4 then break end
	end
	print "-\n"
end




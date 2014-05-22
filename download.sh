



for i in `cat input`; do
	wget -O file --no-check-certificate  "https://wiki.rocksclusters.org/wiki/index.php/Special:Export/$i"

	echo -e 'setns a=http://www.mediawiki.org/xml/export-0.3/\n cat /a:mediawiki/a:page/a:revision/a:text/text()' | \
		xmllint  --nocdata --shell file | tail -n+4 | head -n-1 |
		sed -e 's/&gt;/>/g' -e 's/&lt;/</g' > "$i.mediawiki"
	git add "$i.mediawiki"

done



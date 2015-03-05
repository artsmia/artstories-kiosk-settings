clusters = 200 223 230 236 250 254 258 260 310 321 350 363 375 379
clusters:
	for cluster in $(clusters); do \
		sed "s/__Passcode__/$(Passcode)/; \
			s/__Cluster__/G$$cluster/; \
			s|__SettingsFileLocation__|$(SettingsFileBaseUrl)G$$cluster.xml|; \
			s|__uniqueID__|$$cluster|; \
			s|__SMTPServer__|$(SMTPServer)|; \
			s|__fromEmail__|$(fromEmail)|; \
			s|__toEmail__|$(toEmail)|; \
			" \
		base.xml > G$$cluster.xml; \
	done

deploy:
	rsync -avz G*.xml $(SettingsFileDeployPath)

.PHONY: clusters

# This builds and deploys a test.xml for testing out settings.
# Beware! The G*.xml files are also built, but not deployed. So don't deploy them accidentally.
test: clusters
	sed 's/G200.xml/test.xml/g; s|<string>200</string>|<string>test</string>|' G200.xml > test.xml
	scp test.xml $(SettingsFileDeployPath)

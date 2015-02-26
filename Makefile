clusters = 200 223 230 236 250 254 258 260 310 321 350 363 375 379
clusters:
	for cluster in $(clusters); do \
		sed "s/__Passcode__/$(Passcode)/; \
			s/__Cluster__/G$$cluster/; \
			s|__SettingsFileLocation__|$(SettingsFileBaseUrl)$$file|" \
		base.xml > G$$cluster.xml; \
	done

deploy:
	rsync -avz G*.xml $(SettingsFileDeployPath)

.PHONY: clusters

clusters = 230 260 310 379
clusters:
	echo $(Passcode); \
	for cluster in $(clusters); do \
		file=G$$cluster.xml; \
		cp base.xml "$$file"; \
		sed -i "s/__Passcode__/$(Passcode)/; s/__Cluster__/G$$cluster/; s|__SettingsFileLocation__|$(SettingsFileBaseUrl)$$file|" $$file; \
	done

deploy:
	rsync -avz G*.xml $(SettingsFileDeployPath)

.PHONY: clusters

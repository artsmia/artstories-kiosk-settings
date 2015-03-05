These are the settings we're using on some iPads in the museum.

Settings are build from [base.xml](base.xml), but none of the actual settings are in that file, only placeholder tokens (`__Passcode__`). (We can't publish the passcode here on github or people would know what it is…) The actual settings need to be present in environment variables for the Makefile to pick up.

Here are the variables:

| setting | value |
| ---- | ---- |
| clusters | unique identifiers for different iPad groupings |
| Passcode | the passcode to get into Kiosk Pro's settings interface |
| SettingsFileBaseURL | What's the base URL where these settings files are deployed? |
| SettingsFileDeployPath | where should we `rsync` these files for the iPads to read them? |
| SMTPServer | `KPL` can send emails on different events. This expects a wide-open SMTP server |
| fromEmail | the emails send from this address… |
| toEmail | …to these addresses. It can be a comma separated list |

These settings are used to build an xml file for each cluster (`make clusters`). Then they can be deployed (to `SettingsFileDeployPath`) with `make deploy`.

`make test` will build the cluster xml files, then copy one to
`test.xml` and deploy only that test file. Use this to test settings before they're ready to be applied to all iPads.

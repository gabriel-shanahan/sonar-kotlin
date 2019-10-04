# sonar-kotlin

[![Join the chat at https://kotlinlang.slack.com/messages/C88E12QH4/convo/C0BQ5GZ0S-1511956674.000289/](https://img.shields.io/badge/chat-on_slack-red.svg?style=flat-square)](https://kotlinlang.slack.com/messages/C88E12QH4/convo/C0BQ5GZ0S-1511956674.000289/)
[![build status](https://travis-ci.org/arturbosch/sonar-kotlin.svg?branch=master)](https://travis-ci.org/arturbosch/sonar-kotlin)
[![build status windows](https://ci.appveyor.com/api/projects/status/bn2vto5dnkenxeg5?svg=true
)](https://ci.appveyor.com/project/arturbosch/sonar-kotlin)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Farturbosch%2Fsonar-kotlin.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Farturbosch%2Fsonar-kotlin?ref=badge_shield)

![sonar-kotlin-in-action](img/sonar-kotlin.png)

### Features

- Integrates [detekt](https://github.com/arturbosch/detekt) for code analysis
- Default quality profile `detekt active` (80 rules) and `detekt all` (164 rules)
- Syntax highlighting
- Supports SonarQube 6.7.7 and up
- Supports detekt's `yaml config` and `baseline.xml` (also `path filters`)
- Jacoco support
- Lines of code and complexity metrics

### Usage

This sonar-kotlin is not the official sonarqube plugin.
It was released before the official plugin and uses the same plugin key 'kotlin'.
~~That means you can't use this plugin together with the official one.~~

It is possible to use SonarQube with both this plugin and the official installed, however this plugin will overwrite the official one.

- `git clone https://github.com/arturbosch/sonar-kotlin`
- `cd sonar-kotlin`
- `mvn package`
- `cp target/sonar-kotlin-[enter_version].jar $SONAR_HOME/extensions/plugins`
- `cd $SONAR_HOME/bin/[your_os]`
- `./sonar.sh restart`

Finally, in the SonarQube UI, go to Administration and remove the '.kt' file extension under 'Kotlin'. Instead use any random sequence, but be sure it cannot be a real file suffix. 

### Configurations and Baselines (and Filters)

Read about detekt configuration files [here](https://arturbosch.github.io/detekt/configurations.html)
and about detekt baseline formats [here](https://arturbosch.github.io/detekt/baseline.html).

Best ways to get started is to configure the `detekt-gradle-plugin` in your project and use its `detektBaseline` and 
`detektGenerateConfig` tasks.
- `detektGenerateConfig` copies the default configuration file which you can use to turn on and off rules and set 
appropriate threshold values for some rules.
- `detektBaseline` analyzes your project and generates a baseline xml file with all your current findings. This 
findings won't get reported anymore in sonar.

##### Usage

To make use of this features, you have to set up some properties:

![configs](img/config.png)


__Detekt path filters__ support multiple regex entries by adding a `,` for separating.
__Detekt yaml configuration path__ also supports multiple configuration files where the first entered override some 
values of the later added config files.

##### Limitations

Sonar analyzes each module individually which makes it harder to search for your config files.
If you use relative paths, sonar-kotlin first tries to find the provided path inside this module and if it can't find
 it, we are searching for the file in the parent folder. This leads to the limitation that only projects with 
 sub-projects of depth 1 are supported. If you need more config files in your project hierarchies, provide them in 
 the sub-projects with the same relative path available.

### Mentions

As mentioned/used in ...

- [Sonarqube code coverage for Kotlin on Android with Bitrise](https://android.jlelse.eu/sonarqube-code-coverage-for-kotlin-on-android-with-bitrise-71b2fee0b797)


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Farturbosch%2Fsonar-kotlin.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Farturbosch%2Fsonar-kotlin?ref=badge_large)

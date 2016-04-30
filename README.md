# Jelastic Raptor Cartridge
This cartridge provides [Raptor](http://www.rubyraptor.org/) on Jelastic Platform.

**Phusion Passenger 5** (or **Raptor** as a codename) is a fast, robust and lightweight application server, intended for serving Ruby apps. The key features, that distinguish it from its predecessors, are increased performance (achieved mostly thanks to a custom embedded HTTP engine, completely optimized for ensuring operating rapidness) and advanced visibility (provided through a set of in-built administrative tools).

The main benefits, that Raptor brings you, are:
- automatic offload and acceleration of your hosted application with the help of an integrated and high-performance HTTP cache
- advanced and time-saving automation of a plenty of system tasks
- high security thanks to extra layers of defense
- powerful control tools that provide a developer with clear reporting, forehanded prediction of possible error occurrence, thorough logging, etc

For more details refer to the [Jelastic documentation](http://docs.jelastic.com/raptor).

Follow the [link](http://ops-docs.jelastic.com/private-add-cartridge) in order to find out how to enable the current cartridge at Jelastic dashboard.

### What Jelastic cartridge is?

Jelastic [Platform-as-Infrastructure](http://docs.jelastic.com/what-is-platform-as-infrastructure) supports **OpenShift’s cartridge model** to make it easier for independent software vendors (ISVs) offering core services in multiple platforms and for a wider array of cloud ecosystems and marketplaces. This open standard for technology packaging and deployment enables ISVs and end-users to integrate their own middleware, databases, and services into the platform and make them available to PaaS developers building applications.

A **cartridge** is an advanced packaging format. In our case, it is represented with existing OpenShift cartridge specifications, extended with Jelastic configurations, to provide more complex functionality and the ability to make adjustments in Jelastic. This additional tuning is required based on the difference between the architectures of the two platforms (Jelastic and OpenShift).

Such configuration is quite easy - you just need to fork a basic cartridge and add custom settings. Detailed instruction on how to create your own cartridge can be seen [here](http://ops-docs.jelastic.com/create-cartridge).


### How to add a cartridge to Jelastic Cloud?

Ready cartridge (your own or one of those we’ve already prepared for you) can be added to the Jelastic PaI via JCA. After that it should be tested and published in order to become available through the dashboard. Find out the details in [this](http://ops-docs.jelastic.com/private-add-cartridge) instruction.

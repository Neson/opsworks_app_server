OpsWorks App Server Cookbook
============================

A collection of useful recipes for app servers on OpsWorks.

Recipes
-------

### Locale

- `opsworks_app_server::locale_gen_zhtw` @Setup - locale-gen zh_TW.UTF-8

### NewRelic

 - `newrelic::default` @Setup - installs the New Relic agent that performs the server monitoring

#### Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['newrelic']['license']</tt></td>
    <td>String</td>
    <td>your newrelic license key</td>
    <td><tt>undefined</tt></td>
  </tr>
</table>

### Mosh

Mobile shell, replacement for SSH.

 - `mosh::default` @Setup

### Zsh

 - `zsh::default` @Setup

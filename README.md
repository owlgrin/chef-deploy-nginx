# horntell-nginx-cookbook

Deploys Nginx Sites for Horntell

## Supported Platforms

Ubuntu 14.04.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['horntell-nginx']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### horntell-nginx::default

Include `horntell-nginx` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[horntell-nginx::default]"
  ]
}
```

Other recies included are `web` and `static`.

## License and Authors

Author:: Mohit Mamoria (mohit.mamoria@gmail.com)

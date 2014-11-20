# horntell-nginx-cookbook

Deploys Nginx Sites for Horntell

## Supported Platforms

TODO: List your supported platforms.

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

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)

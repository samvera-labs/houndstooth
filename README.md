# Houndstooth

A meta-model based on [Scooby
Snacks](https://github.com/UCSCLibrary/ScoobySnacks) and [Dog
Biscuits](https://github.com/samvera-labs/dog_biscuits)

# Contributing

Before submitting a pull request, validate the YAML with
[`yamllint`](https://yamllint.readthedocs.io/en/stable/index.html):

```shell
$ yamllint m3.yml
m3.yml
  109:7     warning  comment not indented like content  (comments-indentation)
  122:4     warning  comment not indented like content  (comments-indentation)
  124:6     warning  comment not indented like content  (comments-indentation)
```

# Tools

* yamllint (`gem install yamllint`) - comannd line YAML validation
* [jsonschemalint](https://jsonschemalint.com/#/version/draft-07/markup/json) - web-based tool for validating json against a JSON schema
* [YAML Converter](https://codebeautify.org/yaml-to-json-xml-csv) - web-based tool for converting YAML to JSON
* `validate.rb` - lightweight script to validate an m3 YAML specification against the JSON Schema (`m3_json_schema.json`); run with ruby validate.rb m3.yml
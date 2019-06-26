# Converting a spreadsheet -> m3.yaml format in OpenRefine
## 1) 
In OpenRefine, under the **Export** menu (top right) select **Templating...**

## 2) 
In the **Templating Export** window you'll want to edit the four text fields on the left: 
### Prefix
```
---
rows:
	
```

### Row Template
You'll want to either edit your column headers to match the M3 meta-properties (easier before importing into OpenRefine) or edit the template text to add in your column headers.

```
- {{cells["property_name"].value}}:
    display_label: "{{cells["display_label"].value}}"
    definition: "{{cells["definition"].value}}" 
    usage_guidelines: "{{cells["usage_guidelines"].value}}"
    requirement: "{{cells["requirement"].value}}"
    controlled_value: 
      format:  "{{cells["controlled_values_format"].value}}"
      sources: 
        -  "{{cells["controlled_values_sources"].value}}"
    sample_value: "{{cells["sample_value"].value}}"
    property_uri: {{cells["property_uri"].value}}
    available_on: 
      class: 
        -  {{cells["available_on_class"].value}}
      resource_type: 
        -  {{cells["available_on_resource"].value}}
    range: 
      class_uri: {{cells["class_uri"].value}}
    data_type: {{cells["data_type"].value}}
    syntax: {{cells["syntax"].value}}
    cardinality: 
      minimum:  {{cells["minimum"].value}}
      maximum:  {{cells["maximum"].value}}
    index_documentation:  "{{cells["index_documentation"].value}}"
    validations: 
      match_regex:  {{cells["match_regex"].value}}
    mapping: 
      dpla: "{{cells["dpla_mapping"].value}}"
  # {{cells["Comments"].value}}	
	
```
You will get a preview of your output in the **Templating Export** window.
	
### Row Separator
Change the row separator from the default comma (,) to a blank line.

### Suffix
```
...
```
Export 

## 4. Export and Clean-up 
   - export and save your file with a `.yaml` extension 
   - remove unwanted nulls
   - check formatting

# Editing the template text
* rename your column headers (in a copy of your spreadsheet) to match the M3 meta-properties
* edit the template text replacing the text in "paranthesis" with your column headers
```	{{cells["column name"].value}}
```
* once you've hit export, OpenRefine does not retain any changes you made to the template text, so if you are making any edits that you may want to reuse - save your edits - either working in a text file and copying to OR or working in OR and copying your updated text into a text file for saving. 
* if there are meta-properties you do not have in your data dictionary you can delete those lines from the template to save yourself some clean up
* if you have notes or other columns in your spreadsheet that you'd like to include as comments you can add:
	# {{cells["your_note_column_header"].value}}
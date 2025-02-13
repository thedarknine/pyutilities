# pyutilities
Python utilities for terminal display and logs management

## Usage
```python
from pyutilities_thedarknine import display

# Print messages
display.info("Your script ends")
display.alert("Something went wrong")
display.title("List of resources")

# Print list
from pyutilities_thedarknine import display

rows = ["John", "Jane"]
display.items_list(rows)
```

## Install

```bash
poetry add git+ssh://git@github.com:thedarknine/pyutilities.git
```

## Development

1. Clone repository
2. Install dependencies

* Lint file before commit
```bash
poetry run black display.py logs.py --diff
```

* Lint docstring
```bash
poetry run ruff check
```

* Test
```bash
poetry run pytest
```

* Bump version
```bash
poetry version major
poetry version minor
poetry version patch
```
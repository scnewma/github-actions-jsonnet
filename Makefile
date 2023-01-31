.PHONY: github
github:
	jsonnet .github/raw/main.jsonnet | yq -P > .github/workflows/main.yml

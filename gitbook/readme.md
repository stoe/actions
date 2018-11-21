# Gitbook for GitHub Action
This action allows you to run [`gitbook pdf`](https://github.com/GitbookIO/gitbook).

![](./screenshot.png)


## Usage
To use the action simply add the following lines to your `.github/main.workflow`.

```hcl
action "Run Gitbook" {
  uses = "stoe/actions/gitbook@master"
}
```


### Environment Variables
- **GITBOOK_FOLDER**: (optional) path to the book folder within the repository, defaults to `./`
- **GITBOOK_NAME**: (optional) created PDF filename, defaults to `book.pdf`


## License
The Dockerfile and associated scripts and documentation in this project are released under the [MIT](license).

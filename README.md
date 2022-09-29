
### To Create a Release
There is a github action workflow to auto-build the pdf and create a release. To trigger it, create a git tag locally and put it:

```bash
git tag v0.0.1
git push origin v0.0.1
```

The PDF generated from the latest release will always be at this URL: https://github.com/mit-pdos/6.1600-notes/releases/latest/download/lecture-notes.pdf

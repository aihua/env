## Contributing

First off, thank you for considering contributing to this project. It's people
like you that make this project such a great tool.

### Where do I go from here?

If you've noticed a bug or have a feature request, [make one][new issue]! It's
generally best if you get confirmation of your bug or approval for your feature
request this way before starting to code.

If you have a general question about this project, you can post it on [Stack
Overflow], the issue tracker is only for bugs and feature requests.

### Fork & create a branch

If this is something you think you can fix, then fork  and create
a branch with a descriptive name.

A good branch name would be (where issue #325 is the ticket you're working on):

```sh
git checkout -b 325-add-settings-for-idea
```

### Make a Pull Request

At this point, you should switch back to your master branch and make sure it's
up to date with aihua/env's master branch:

```sh
git remote add upstream git@github.com:aihua/env.git
git checkout master
git pull upstream master
```

Then update your feature branch from your local copy of master, and push it!

```sh
git checkout 325-add-settings-for-idea
git rebase master
git push --set-upstream origin 325-add-settings-for-idea
```

Finally, go to GitHub and [make a Pull Request][] :D

### Keeping your Pull Request updated

If a maintainer asks you to "rebase" your PR, they're saying that a lot of code
has changed, and that you need to update your branch so it's easier to merge.

To learn more about rebasing in Git, there are a lot of [good][git rebasing]
[resources][interactive rebase] but here's the suggested workflow:

```sh
git checkout 325-add-settings-for-idea
git pull --rebase upstream master
git push --force-with-lease 325-add-settings-for-idea
```

### Merging a PR (maintainers only)

A PR can only be merged into master by a maintainer if:

* It is passing CI.
* It has been approved by at least two maintainers. If it was a maintainer who
  opened the PR, only one extra approval is needed.
* It has no requested changes.
* It is up to date with current master.

Any maintainer is allowed to merge a PR if all of these conditions are
met.

[new issue]: https://github.com/aihua/env/issues/new
[fork aihua/env]: https://help.github.com/articles/fork-a-repo
[make a pull request]: https://help.github.com/articles/creating-a-pull-request
[git rebasing]: https://git-scm.com/book/en/Git-Branching-Rebasing
[interactive rebase]: https://help.github.com/en/github/using-git/about-git-rebase
[shortcut reference links]: https://github.github.com/gfm/#shortcut-reference-link

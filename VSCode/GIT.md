https://andytimmons@dev.azure.com/andytimmons/VSC_md/_git/VSC_md
git remote add origin https://andytimmons@dev.azure.com/andytimmons/VSC_md/_git/VSC_md
git push -u origin --all

## Git tutorial

[Git Tutorial](file:///C:/Program%20Files/Git/mingw64/share/doc/git-doc/gitcore-tutorial.html)

[gittutorial](file:///C:/Program%20Files/Git/mingw64/share/doc/git-doc/gittutorial.html)

[the Git User Manual](file:///C:/Program%20Files/Git/mingw64/share/doc/git-doc/user-manual.html)
## Git Documentation is locally in MingW32

[GIT Local](file:///C:/Program%20Files/Git/mingw64/share/doc/git-doc)

[Basic Everyday Functions](file:///C:/Program%20Files/Git/mingw64/share/doc/git-doc/giteveryday.html)


```sh
$ git status # (1)
    #  see what you were in the middle of doing, if anything.
$ git branch --no-merged master # (2)
    #  see which branches haven’t been merged into master yet. Likewise for any other integration branches e.g. maint, next and pu (potential updates).
$ mailx # (3)
    #  read mails, save ones that are applicable, and save others that are not quite ready (other mail readers are available).
& s 2 3 4 5 ./+to-apply
& s 7 8 ./+hold-linus
& q
$ git checkout -b topic/one master
$ git am -3 -i -s ./+to-apply # (4)
    #  apply them, interactively, with your sign-offs.
$ compile/test
$ git checkout -b hold/linus && git am -3 -i -s ./+hold-linus # (5)
    #  create topic branch as needed and apply, again with sign-offs.
$ git checkout topic/one && git rebase master # (6)
    #  rebase internal topic branch that has not been merged to the master or exposed as a part of a stable branch.
$ git checkout pu && git reset --hard next # (7)
    #  restart pu every time from the next.
$ git merge topic/one topic/two && git merge hold/linus # (8)
    #  and bundle topic branches still cooking.
$ git checkout maint
$ git cherry-pick master~4 # (9)
    #  backport a critical fix.
$ compile/test
$ git tag -s -m "GIT 0.99.9x" v0.99.9x # (10)
    #   create a signed tag.
$ git fetch ko && for branch in master maint next pu # (11)
    #   make sure master was not accidentally rewound beyond that already pushed out.
do
git show-branch ko/$branch $branch # (12)
    #   In the output from git show-branch, master should have everything ko/master has, and next should have everything ko/next has, etc.
done
$ git push --follow-tags ko # (13)
# push out the bleeding edge, together with new tags that point into the pushed history.
```





Get packages using Visual Studio


Package source URL


https://pkgs.dev.azure.com/andytimmons/_packaging/andytimmons/nuget/v3/index.json

Push packages using NuGet.exe
Get the tools

Add this feed

nuget.exe sources Add -Name "andytimmons" -Source "https://pkgs.dev.azure.com/andytimmons/_packaging/andytimmons/nuget/v3/index.json"


Push a package
nuget.exe push -Source "andytimmons" -ApiKey AzureDevOps my_package.nupkg


Get packages with pip
Set up a virtualenv
If you don't already have one, create a virtualenv using [these](https://go.microsoft.com/fwlink/?linkid=2015235) instructions from the official Python documentation. Per the instructions, "it is always recommended to use a virtualenv while developing Python applications."
Protect your credentials
Ensure your credentials aren't checked into source control. If you're using git, create a .gitignore file in the root of your repo (or open your existing one) add a new line with the name of your virtualenv. For example, if you used the instructions above and called your environment eng, use: eng/. If you're using another source control system, consult its documentation to properly ignore your vitualenv.
Set up your pip.ini/pip.conf


In your virtualenv, create a pip.ini (Windows) or pip.conf (Mac and Linux) file (or open your existing one). Then, click Generate Python credentials and copy the credentials to the file you created/opened.
View(What's this?)

Add this to your pip.ini
```text
[global]
index-url=https://andytimmons:eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Im9PdmN6NU1fN3AtSGpJS2xGWHo5M3VfVjBabyJ9.eyJuYW1laWQiOiJmZmMwNDVmNC00ODg0LTQ1MzgtYjkxZC01N2U4NWQ0MjVhN2EiLCJzY3AiOiJ2c28uZHJvcF93cml0ZSB2c28ucGFja2FnaW5nX3dyaXRlIiwiYXVpIjoiMzU4NTc1NmQtMDFhYy00ZDRjLWExNmQtYzYwNDJlZjM5NzlmIiwic2lkIjoiMWQ2NTgwZGQtMWY1Zi00MWJhLTgxYjgtNDY1OWMzN2EyYzcxIiwiaXNzIjoiYXBwLnZzdG9rZW4udmlzdWFsc3R1ZGlvLmNvbSIsImF1ZCI6ImFwcC52c3Rva2VuLnZpc3VhbHN0dWRpby5jb218dnNvOjEwYzU4Mzc1LTRlYTctNDMxNi1hNDUyLWQyZTViY2VhNWI1OSIsIm5iZiI6MTU1Nzk1MjExOCwiZXhwIjoxNTY1NzI4NzE4fQ.veR0m5xiFEDslM_MdGTQ8yenTiBeP_AM-TYWVfiNfD6d3QPvCK_kewLFWUgwa8Euo-QTtx_S0ci8mnSyyKzGa6xEs0v418hiS7BAJyFWzBPT3m_f7TR4uO4NmPgzcSRsBsHltSXdUSQ5FHBGEpS1fRUd0YEtJLeSTEVifZSDL1QkyArxtzg20zIZ6c2TjR-FUQvEzVzFP_BC_FBFKh2blbuIxibN6D-7TX38E1qmVtSVk11zi2bM7nx-bRpJxwFnriOTzCu5b1g-TtHgFNHCPuHuJKPszeH1eXKHZF6Yu9seydJDcSRvmYzj6zjk-0xjmu9p96BAvL2Wl8w90n0lSA@pkgs.dev.azure.com/andytimmons/_packaging/andytimmons/pypi/simple/
```


Install a package
To install a package, close this dialog and copy the install command from any package details page's Get this package section.
Upload packages with twine
Set up your .pypirc
Create a .pypirc in your home directory (or open your existing one). Then, click Generate Python credentials and copy the credentials to the file you created/opened.

```text
Add this to your .pypirc
[distutils]
Index-servers =
  pypi
  andytimmons

[andytimmons]
Repository = https://pkgs.dev.azure.com/andytimmons/_packaging/andytimmons/pypi/upload
username = andytimmons
password = eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Im9PdmN6NU1fN3AtSGpJS2xGWHo5M3VfVjBabyJ9.eyJuYW1laWQiOiJmZmMwNDVmNC00ODg0LTQ1MzgtYjkxZC01N2U4NWQ0MjVhN2EiLCJzY3AiOiJ2c28uZHJvcF93cml0ZSB2c28ucGFja2FnaW5nX3dyaXRlIiwiYXVpIjoiM2U0Mjg2ZTAtM2Q3Yi00ZmExLWI4ZmItNzQ0NjVlYWIyYTVlIiwic2lkIjoiMjFjMDMwOWMtZTlmMy00ZTFjLWE0NmItN2IzNjFjMjFlOWIyIiwiaXNzIjoiYXBwLnZzdG9rZW4udmlzdWFsc3R1ZGlvLmNvbSIsImF1ZCI6ImFwcC52c3Rva2VuLnZpc3VhbHN0dWRpby5jb218dnNvOjEwYzU4Mzc1LTRlYTctNDMxNi1hNDUyLWQyZTViY2VhNWI1OSIsIm5iZiI6MTU1Nzk1MjE1NiwiZXhwIjoxNTY1NzI4NzU2fQ.JAouLYoPHs9CF0z4DPbEVOwhQYtV2w1I-gfdl1k9RUKbwzLuvokIGA9xKTGAgJ6Hm26WT91GJEylINckMAX_heQXtGWwHOVDiqa2kRgwDVuI_w_iMlTgnZdNHrb5Kmbnmp4p5jEDUuX1TExqzu06DIdavtvo8tDPlYpxtNYoY-3Dkq4wRirkBuBnlgq7KAEbfOrjVcYVr02U-fX1szoLtTQ8q_hauoxhSF8qEjSNjwV5lnY3qrBfC7dzZ4RQD_t3oOjzIzQqZ1GiU26wkM2FMVKzCjVcQ2NHXzCjAeEP_wJqwP3KihLI90_9OePL_XCnfyJIfttb97gNrSZCDNnzFg
```

Avoid accidental publishes to PyPI
If you already have a .pypirc and it contains credentials for the public PyPI index, we recommend avoiding accidental publishes of private packages by removing the [pypi] section of your .pypirc.
Create your package
Create a wheel or [other](https://go.microsoft.com/fwlink/?linkid=2015238) supported distribution format using the standard python commands. In the folder that contains your setup.py, run the command below.
python setup.py bdist_wheel
Upload your package
In the same directory, copy and run the upload command below. Important: always remember to provide the -r [feed-name-here] flag to avoid publishing your private packages to PyPI.
twine upload -r andytimmons dist/*


Azure CLI
The Azure DevOps Extension for Azure CLI is used to publish and download packages
[Get the Azure CLI and the Azure DevOps Extension](https://go.microsoft.com/fwlink/?linkid=2090408)
Publish packages
Publish a package

```cmd
az artifacts universal publish \
  --organization "https://dev.azure.com/andytimmons/" \
  --feed "andytimmons" \
  --name "my-package-name" \
  --version "12.2.0" \
  --description "My description" \
  --path .
```

Download packages
To download a package, install the client tool using the link above, then use the download command on the package's page

## NPM

Install or restore packages using npm
View(What's this?)

Add this feed to your project .npmrc

        registry=https://pkgs.dev.azure.com/andytimmons/_packaging/andytimmons/npm/registry/
        always-auth=true
Recommended (for Windows users):Install and run the auth helper
`npm install -g vsts-npm-auth --registry https://registry.npmjs.com --always-auth false`
`vsts-npm-auth -config .npmrc`
Alternative:Add credentials to your user .npmrc manually
; Treat this auth token like a password. Do not share it with anyone, including Microsoft support. This token expires on or before 8/13/2019.
; begin auth token
//pkgs.dev.azure.com/andytimmons/_packaging/andytimmons/npm/registry/:_authToken=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Im9PdmN6NU1fN3AtSGpJS2xGWHo5M3VfVjBabyJ9.eyJuYW1laWQiOiJmZmMwNDVmNC00ODg0LTQ1MzgtYjkxZC01N2U4NWQ0MjVhN2EiLCJzY3AiOiJ2c28uZHJvcF93cml0ZSB2c28ucGFja2FnaW5nX3dyaXRlIiwiYXVpIjoiY2FjZmM5YmItNDJkMy00NGIxLThhN2ItOTI4YTc3MmEyNTAzIiwic2lkIjoiODQ3MjI2OTUtMDE3Mi00ZDgwLTg1OGUtMTllM2FhZGE4YmFmIiwiaXNzIjoiYXBwLnZzdG9rZW4udmlzdWFsc3R1ZGlvLmNvbSIsImF1ZCI6ImFwcC52c3Rva2VuLnZpc3VhbHN0dWRpby5jb218dnNvOjEwYzU4Mzc1LTRlYTctNDMxNi1hNDUyLWQyZTViY2VhNWI1OSIsIm5iZiI6MTU1Nzk1MjM1MiwiZXhwIjoxNTY1NzI4OTUyfQ.qXkF5HlCWPdxm0HuCRHuNOaCQbZb8mXGkiAdv8IoB_FE56B4h2wk4SPXye1y6jAz_RbO5fO99JkGOiX5qwuxrHCZRBsUfZWGqLgcttagJNfMHm_olmMDB79lsiZvYz0ZgJGbBvTg-nJNFrdI7lj_0tbhhTzImVr-jvoe4-xSFhxrg3ZhLQsTB7ezd23oEnYfjfL6x1CtnARoAkqPM5PoGApExdUK5hUQ8ivXgrGeJ5DHxOuhNQV7Y2op83QZHUdk5wHUCTsb3AJzLP58RHgCw1eim4JC7vAP7usHGKMLPzi3aLHO10T9bMyKM6OUYrHR6CBanTTzmaIQuq7SfKH2uQ
//pkgs.dev.azure.com/andytimmons/_packaging/andytimmons/npm/:_authToken=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Im9PdmN6NU1fN3AtSGpJS2xGWHo5M3VfVjBabyJ9.eyJuYW1laWQiOiJmZmMwNDVmNC00ODg0LTQ1MzgtYjkxZC01N2U4NWQ0MjVhN2EiLCJzY3AiOiJ2c28uZHJvcF93cml0ZSB2c28ucGFja2FnaW5nX3dyaXRlIiwiYXVpIjoiY2FjZmM5YmItNDJkMy00NGIxLThhN2ItOTI4YTc3MmEyNTAzIiwic2lkIjoiODQ3MjI2OTUtMDE3Mi00ZDgwLTg1OGUtMTllM2FhZGE4YmFmIiwiaXNzIjoiYXBwLnZzdG9rZW4udmlzdWFsc3R1ZGlvLmNvbSIsImF1ZCI6ImFwcC52c3Rva2VuLnZpc3VhbHN0dWRpby5jb218dnNvOjEwYzU4Mzc1LTRlYTctNDMxNi1hNDUyLWQyZTViY2VhNWI1OSIsIm5iZiI6MTU1Nzk1MjM1MiwiZXhwIjoxNTY1NzI4OTUyfQ.qXkF5HlCWPdxm0HuCRHuNOaCQbZb8mXGkiAdv8IoB_FE56B4h2wk4SPXye1y6jAz_RbO5fO99JkGOiX5qwuxrHCZRBsUfZWGqLgcttagJNfMHm_olmMDB79lsiZvYz0ZgJGbBvTg-nJNFrdI7lj_0tbhhTzImVr-jvoe4-xSFhxrg3ZhLQsTB7ezd23oEnYfjfL6x1CtnARoAkqPM5PoGApExdUK5hUQ8ivXgrGeJ5DHxOuhNQV7Y2op83QZHUdk5wHUCTsb3AJzLP58RHgCw1eim4JC7vAP7usHGKMLPzi3aLHO10T9bMyKM6OUYrHR6CBanTTzmaIQuq7SfKH2uQ
; end auth token
Copy this to your npmrc now. We don't store the auth token and you won't be able to see it again.
[How do I find my .npmrc files?](https://go.microsoft.com/fwlink/?linkid=823700)


## GIT Commands

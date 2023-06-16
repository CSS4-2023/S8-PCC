#!/bin/bash

# Description du fichier de test de la VM-gitea

# Le but de ce script est de tester :

# - le bon fonctionnement du service git hébergé sur le serveur Gitea
# - la bonne configuration du service Gitea (via un utilisateur Test)
# - vérification des commandes git basiques via un scénario de Test

# Auteur : Théo Lurat

reset='\033[0m'
blue='\033[36m'
green='\033[32m'
red='\033[31m'

# Define the server URL
SERVER_URL="http://192.168.4.25/gitea"

# Define the organization name
ORG_NAME="TestOrg"

# Define the test repository name
REPO_NAME="test-repo"

# Define the test file name
FILE_NAME="test-file.txt"

# Define the milestone name
MILESTONE_NAME="test-milestone"

# Define the issue title and description
ISSUE_TITLE="Test Issue"
ISSUE_DESC="This is a test issue."

# Define the Git username and password
GIT_USERNAME="Test"
GIT_PASSWORD="testcss4"

# Set up Git config
echo -e "${blue}Setting up Git config...${reset}"
git config --global user.name "Test" &&
git config --global user.email "test@automative-test.com" &&

git config --global credential.helper 'store --file ~/.git-credentials'
echo "$SERVER_URL;$GIT_USERNAME;$GIT_PASSWORD" >> ~/.git-credentials
echo -e "${green}Setting up Git config... Done!${reset}"

# Create a test organization
echo -e "${blue}Creating test organization...${reset}"
ORG_RESP=$(curl -sS -X POST -H "Content-Type: application/json" -u $GIT_USERNAME:$GIT_PASSWORD -d "{\"username\":\"$ORG_NAME\"}" $SERVER_URL/api/v1/orgs)
ORG_ID=$(echo $ORG_RESP | jq -r '.id')

# Create a test repository in the organization
echo -e "${blue}Creating test repository...${reset}"
output=$(curl -X POST -H "Content-Type: application/json" -u $GIT_USERNAME:$GIT_PASSWORD -d "{\"name\":\"$REPO_NAME\", \"private\": true, \"team_ids\":[$TEAM_ID]}" $SERVER_URL/api/v1/org/$ORG_NAME/repos)

# Verify Org & Repo creation
if echo "$output" | grep -q '"username":"TestOrg"},"name":"test-repo","full_name":"TestOrg/test-repo"'; then
    echo -e "${green}Test ok !${reset}"
else
    echo -e "${red}Test failed !${reset}"
fi

# Clone the test repository
echo -e "${blue}Cloning test repository...${reset}"
output2=$(git clone http://$GIT_USERNAME:$GIT_PASSWORD@192.168.4.25/gitea/$ORG_NAME/$REPO_NAME.git 2>&1)

# Verify clone test repository
if echo "$output2" | grep -q 'test-repo'; then
    echo -e "${green}Test ok !${reset}"
else
    echo -e "${red}Test failed !${reset}"
fi

# Create a test file
echo -e "${blue}Creating test file...${reset}"
cd $REPO_NAME
echo "This is a test file." > $FILE_NAME

# Add and commit the test file
echo -e "${blue}Committing test file...${reset}"
git add $FILE_NAME
output3=$(git commit -m "Added test file" 2>&1)

# Verify commit test file
if echo "$output3" | grep -q 'Added test file'; then
    echo -e "${green}Test ok !${reset}"
else
    echo -e "${red}Test failed !${reset}"
fi

# Push the changes to the server
echo -e "${blue}Pushing changes to server...${reset}"
output4=$(git push 2>&1)

# Verify push
if echo "$output4" | grep -q 'To http://192.168.4.25/gitea/TestOrg/test-repo.git'; then
    echo -e "${green}Test ok !${reset}"
else
    echo -e "${red}Test failed !${reset}"
fi

# Create a milestone
echo -e "${blue}Creating milestone...${reset}"
MILESTONE_RESP=$(curl -sS -X POST -H "Content-Type: application/json" -u $GIT_USERNAME:$GIT_PASSWORD -d "{\"title\":\"$MILESTONE_NAME\"}" $SERVER_URL/api/v1/repos/$ORG_NAME/$REPO_NAME/milestones)
MILESTONE_ID=$(echo $MILESTONE_RESP | jq -r '.id')

# Create an issue
echo -e "${blue}Creating issue...${reset}"
output5=$(curl -X POST -H "Content-Type: application/json" -u $GIT_USERNAME:$GIT_PASSWORD -d "{\"title\":\"$ISSUE_TITLE\",\"body\":\"$ISSUE_DESC\",\"milestone\":$MILESTONE_ID}" $SERVER_URL/api/v1/repos/$ORG_NAME/$REPO_NAME/issues)

# Verify issue and milestone
if echo "$output5" | grep -q '"title":"Test Issue","body":"This is a test issue."'; then
    echo -e "${green}Test ok !${reset}"
else
    echo -e "${red}Test failed !${reset}"
fi

# Remove the test repository
echo -e "${red}Removing test repository...${reset}"
curl -X DELETE -u $GIT_USERNAME:$GIT_PASSWORD $SERVER_URL/api/v1/repos/$ORG_NAME/$REPO_NAME

# Remove the test organization
echo -e "${red}Removing test organization...${reset}"
curl -X DELETE -u $GIT_USERNAME:$GIT_PASSWORD $SERVER_URL/api/v1/orgs/$ORG_NAME

# Clean up Git credentials
echo -e "${red}Cleaning up Git credentials...${reset}"
git config --global --unset credential.helper
rm ~/.git-credentials

# Clean up directory
cd ..
rm -rf test-repo/

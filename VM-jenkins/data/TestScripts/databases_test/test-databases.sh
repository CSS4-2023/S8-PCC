echo "Clemba.49" | sudo -S apt-get install mysql-client -y >> log.txt
test1_verif="Tables_in_gitea access access_token action app_state attachment badge collaboration comment commit_status commit_status_index deleted_branch deploy_key email_address email_hash external_login_user follow foreign_reference gpg_key gpg_key_import hook_task issue issue_assignees issue_content_history issue_dependency issue_index issue_label issue_user issue_watch label language_stat lfs_lock lfs_meta_object login_source milestone mirror notice notification oauth2_application oauth2_authorization_code oauth2_grant org_user package package_blob package_blob_upload package_file package_property package_version project project_board project_issue protected_branch protected_tag public_key pull_auto_merge pull_request push_mirror reaction release renamed_branch repo_archiver repo_indexer_status repo_redirect repo_topic repo_transfer repo_unit repository review review_state session star stopwatch system_setting task team team_invite team_repo team_unit team_user topic tracked_time two_factor upload user user_badge user_open_id user_redirect user_setting version watch webauthn_credential webhook "
test1=$(mysql gitea -u gitea -h 172.16.1.3 -p"(!css4!)" -e "show tables;" | tr -s '\n' ' ')

if [[ ${test1_verif} == ${test1} ]]; then
    echo "
    Connexion à la base de donnée gitea réussi et base de donnée bien remplie"
else
    echo "
    test base de donnée gitea échoué"
fi
test2_verif="Tables_in_wordp wp_commentmeta wp_comments wp_links wp_options wp_postmeta wp_posts wp_term_relationships wp_term_taxonomy wp_termmeta wp_terms wp_usermeta wp_users "
test2=$(mysql wordp -u wordp -h 172.16.1.4 -p"(!css4!)" -e "show tables;" | tr -s '\n' ' ')

if [[ ${test2_verif} == ${test2} ]]; then
    echo "
    Connexion à la base de donnée web réussi et base de donnée bien remplie"
else
    echo "
    test base de donnée web échoué"
fi


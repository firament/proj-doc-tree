#! /bin/bash
## Bootstrap the folder structure
# Run from root folder, where the tree is required.

ROOT_FOLDER="${HOME}/Documents/PMDocs-SampleTree";
PROJ_FOLDER="$(realpath $(dirname $0))/SampleTree";

MakeEmptyTree(){
	echo "Creating folder tree";
	cd "${ROOT_FOLDER}";
	mkdir -vp 01-Notes;
	mkdir -vp 10-Init;
	mkdir -vp 10-Init/110-Client-Docs;
	mkdir -vp 10-Init/120-Features;
	mkdir -vp 10-Init/130-Scope;
	mkdir -vp 10-Init/140-Charter;
	mkdir -vp 20-Plan;
	mkdir -vp 20-Plan/210-Infrastructure;
	mkdir -vp 20-Plan/220-Schedule;
	mkdir -vp 20-Plan/230-Resources;
	mkdir -vp 20-Plan/240-CRs;
	mkdir -vp 30-Design;
	mkdir -vp 30-Design/310-DB;
	mkdir -vp 30-Design/310-DB/3110-SQL;
	mkdir -vp 30-Design/320-Server;
	mkdir -vp 30-Design/330-UI-Web;
	mkdir -vp 30-Design/340-UI-App;
	mkdir -vp 30-Design/380-Artefacts;
	mkdir -vp 30-Design/380-Diagrams;
	mkdir -vp 40-Develop;
	mkdir -vp 40-Develop/410-GuidelinesAndStandards;
	mkdir -vp 40-Develop/420-Process;
	mkdir -vp 40-Develop/430-Reviews;
	mkdir -vp 50-QA;
	mkdir -vp 50-QA/510-PlansAndCases;
	mkdir -vp 50-QA/520-Data;
	mkdir -vp 50-QA/530-Results;
	mkdir -vp 50-QA/540-Automation;
	mkdir -vp 60-Release;
	mkdir -vp 60-Release/610-ReleaseNotes;
	mkdir -vp 70-Track;
	mkdir -vp 70-Track/70-StatusUpdates;
	mkdir -vp 70-Track/70-IssueLogs;
	mkdir -vp 80-Miscellaneous;
	echo "Done...";
}

MakeReadMeFiles (){
	echo "Adding Readme files toeach folder";
	cd "${ROOT_FOLDER}";
	touch README.md;
	touch 01-Notes/README.md;
	touch 01-Notes/_local-notes.md;
	touch 10-Init/README.md;
	touch 10-Init/110-Client-Docs/README.md;
	touch 10-Init/120-Features/README.md;
	touch 10-Init/130-Scope/README.md;
	touch 10-Init/140-Charter/README.md;
	touch 20-Plan/README.md;
	touch 20-Plan/210-Infrastructure/README.md;
	touch 20-Plan/220-Schedule/README.md;
	touch 20-Plan/230-Resources/README.md;
	touch 20-Plan/240-CRs/README.md;
	touch 20-Plan/240-CRs/01-CR-log.md;
	touch 30-Design/README.md;
	touch 30-Design/310-DB/README.md;
	touch 30-Design/310-DB/db-domains.md
	touch 30-Design/310-DB/dd-dropdowns.md
	touch 30-Design/310-DB/db-ref-notes.md
	touch 30-Design/310-DB/3110-SQL/README.md
	touch 30-Design/310-DB/3110-SQL/db-10-init.sql
	touch 30-Design/310-DB/3110-SQL/db-20-create.sql
	touch 30-Design/310-DB/3110-SQL/db-21-create-views.sql
	touch 30-Design/310-DB/3110-SQL/db-48-drop-views.sql
	touch 30-Design/310-DB/3110-SQL/db-49-drop.sql
	touch 30-Design/320-Server/README.md;
	touch 30-Design/330-UI-Web/README.md;
	touch 30-Design/340-UI-App/README.md;
	touch 30-Design/380-Artefacts/README.md;
	touch 30-Design/380-Diagrams/README.md;
	touch 30-Design/App-Model.vpp;
	touch 40-Develop/README.md;
	touch 40-Develop/410-GuidelinesAndStandards/README.md;
	touch 40-Develop/420-Process/README.md;
	touch 40-Develop/430-Reviews/README.md;
	touch 50-QA/README.md;
	touch 50-QA/510-PlansAndCases/README.md;
	touch 50-QA/520-Data/README.md;
	touch 50-QA/530-Results/README.md;
	touch 50-QA/540-Automation/README.md;
	touch 60-Release/README.md;
	touch 60-Release/610-ReleaseNotes/README.md;
	touch 60-Release/620-Changelog.md;
	touch 70-Track/README.md;
	touch 70-Track/70-StatusUpdates/README.md;
	touch 70-Track/70-IssueLogs/README.md;
	touch 80-Miscellaneous/README.md;
	echo "Done...";
}

# Run only ONCE, or content will be ovwrwritten.
# MakeEmptyTree 2>&1   | tee bootstrap-$(date +"%Y%m%d-%s").log;
# MakeReadMeFiles 2>&1 | tee bootstrap-$(date +"%Y%m%d-%s").log;
# rsync -vrh ${ROOT_FOLDER}/ ${PROJ_FOLDER};

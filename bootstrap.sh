#! /bin/bash
## Bootstrap the folder structure
# Run from root folder, where the tree is required.

# This file is part of proj-doc-tree.
#
# proj-doc-tree is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# proj-doc-tree is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with proj-doc-tree. If not, see <https://www.gnu.org/licenses/>.

ROOT_FOLDER="${HOME}/Documents/PMDocs-SampleTree-$(date +"%y%m%d-%H%M")";
PROJ_FOLDER="$(realpath $(dirname $0))/SampleTree";

MakeEmptyTree(){
	echo "Creating folder tree.";
	echo "Cache Folder:   ${ROOT_FOLDER}";
	echo "Project Folder: ${PROJ_FOLDER}";
	mkdir -vp "${ROOT_FOLDER}";
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
	mkdir -vp 20-Plan/250-Debt/2510-TechDebt;
	mkdir -vp 20-Plan/250-Debt/2520-FeatureDebt;
	mkdir -vp 30-Design;
	mkdir -vp 30-Design/300-System;
	mkdir -vp 30-Design/310-DB;
	mkdir -vp 30-Design/310-DB/3110-SQL;
	mkdir -vp 30-Design/310-DB/3110-SQL/Consolidated;
	mkdir -vp 30-Design/320-API;
	mkdir -vp 30-Design/330-UI;
	mkdir -vp 30-Design/330-UI/3310-Web;
	mkdir -vp 30-Design/330-UI/3320-Android;
	mkdir -vp 30-Design/330-UI/3330-iOS;
	mkdir -vp 30-Design/340-Test-Automation;
	mkdir -vp 30-Design/380-Artefacts/Copies;
	mkdir -vp 30-Design/380-Artefacts/Exported;
	mkdir -vp 30-Design/380-Artefacts/Generated;
	mkdir -vp 30-Design/380-Diagrams-ERD;
	mkdir -vp 30-Design/380-Diagrams-UML;
	mkdir -vp 30-Design/390-Utilities;
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
	mkdir -vp 70-Track/710-StatusUpdates;
	mkdir -vp 70-Track/720-IssueLogs;
	mkdir -vp 80-Stabilize;
	mkdir -vp 90-Miscellaneous;
	echo "Done...";
}

MakeReadMeFiles (){
	echo "Adding Readme files to each folder";
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
	touch 20-Plan/250-Debt/README.md;
	touch 20-Plan/250-Debt/2510-TechDebt/.keep;
	touch 20-Plan/250-Debt/2520-FeatureDebt/.keep;

	touch 30-Design/README.md;
	touch 30-Design/300-System/README.md;
	touch 30-Design/310-DB/README.md;
	touch 30-Design/310-DB/db-domains.md;
	touch 30-Design/310-DB/dd-dropdowns.md;
	touch 30-Design/310-DB/db-ref-notes.md;
	touch 30-Design/310-DB/util-up-consolidated.sh;
	touch 30-Design/310-DB/3110-SQL/README.md;
	touch 30-Design/310-DB/3110-SQL/db-10-init.sql;
	touch 30-Design/310-DB/3110-SQL/db-12-perms.sql;
	touch 30-Design/310-DB/3110-SQL/db-20-create-tables.sql;
	touch 30-Design/310-DB/3110-SQL/db-30-create-views.sql;
	touch 30-Design/310-DB/3110-SQL/db-50a-seed-lokups.sql;
	touch 30-Design/310-DB/3110-SQL/db-80-drop-views.sql;
	touch 30-Design/310-DB/3110-SQL/db-90-drop-tables.sql;
    touch 30-Design/310-DB/3110-SQL/Consolidated/.keep;
    touch 30-Design/320-API/README.md;
    touch 30-Design/330-UI/README.md;
    touch 30-Design/330-UI/3310-Web/.keep;
    touch 30-Design/330-UI/3320-Android/.keep;
    touch 30-Design/330-UI/3330-iOS/.keep;
    touch 30-Design/340-Test-Automation/.keep;
	touch 30-Design/380-Artefacts/README.md;
	touch 30-Design/380-Artefacts/Copies/.keep;
	touch 30-Design/380-Artefacts/Exported/.keep;
	touch 30-Design/380-Artefacts/Generated/.keep;
	touch 30-Design/380-Diagrams-ERD/README.md;
	touch 30-Design/380-Diagrams-ERD/.keep;
	touch 30-Design/380-Diagrams-UML/.keep;
	touch 30-Design/390-Utilities/README.md;
	touch 30-Design/390-Utilities/bundle-sql-scripts.sh;
	touch 30-Design/390-Utilities/scrub-database.md;
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

	touch 80-Stabilize/README.md;

	touch 90-Miscellaneous/README.md;

	echo "Done...";
}

# Run only ONCE, or content will be ovwrwritten.
MakeEmptyTree 2>&1   | tee bootstrap-$(date +"%y%m%d-%H%M")-tree.log;
MakeReadMeFiles 2>&1 | tee bootstrap-$(date +"%y%m%d-%H%M")-files.log;
rsync -vrh ${ROOT_FOLDER}/ ${PROJ_FOLDER};
echo "Done."

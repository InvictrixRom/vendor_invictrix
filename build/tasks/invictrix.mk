# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 CarbonROM
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


INVICTRIX_TARGET_PACKAGE := $(PRODUCT_OUT)/Invictrix-$(INVICTRIX_BUILD_TYPE)-$(INVICTRIX_VERSION)-$(shell date +"%Y%m%d-%H%M")-$(INVICTRIX_POSTFIX).zip

.PHONY: invictrix
invictrix: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(INVICTRIX_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(INVICTRIX_TARGET_PACKAGE) > $(INVICTRIX_TARGET_PACKAGE).md5sum
	@echo ""
	@echo -e ${CL_YLW}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
	@echo -e ${CL_YLW}"///ssshssssss+                                                    ://////yooo++/"${CL_RST}
	@echo -e ${CL_YLW}"y//yhhNo/////:                                                    /+++++oNhhy++y"${CL_RST}
	@echo -e ${CL_YLW}"mo//ooNm/--/+:                                                    /o:::/mNss+/sm"${CL_RST}
	@echo -e ${CL_YLW}"hNs:/+yMNhsyo:                                                    +yoshNMy+/:sNh"${CL_RST}
	@echo -e ${CL_YLW}"oNMdoo/yNMNmy/`                                                  `+hhNMNy/oodMNo"${CL_RST}
	@echo -e ${CL_YLW}":oNMMmho+dMMMmy/-..-..```` ``````````````````````````     `````./ymMMNm+ohmMMNo/"${CL_RST}
	@echo -e ${CL_YLW}"oo/dMMMNdhyhNMMMNdyy//-...`yyhhhhhhhhhhsshhhhhhhhhhyy`..../+yshNMMMNmsymNMMMd/+o"${CL_RST}
	@echo -e ${CL_YLW}"sNyomNMMMMNo+hMMMMMNy/-...`h./oyhhhyso+ss++syhhhyo/.y`....+yNMMMMMh/+NMMMMNmoyNy"${CL_RST}
	@echo -e ${CL_YLW}":dMMdyydNMMMm/oNMMMMMm+...`h      `-smMMMMds:`      y`:::omMMMMMNs/mMMMNdhydMMd/"${CL_RST}
	@echo -e ${CL_YLW}":/dMMMNdyyhmMNs+NMMMMMMy//.h     :dMMMMMMMMMMd-     y.//sMMMMMMN+sNMNdhhdNMMMd/+"${CL_RST}
	@echo -e ${CL_YLW}"shohNMMMMNmhyhmyoNMMMMMMs/`h    .MMMMMMMMMMMMMN`    y.+sMMMMMMNoymhyhmNMMMMNh/ys"${CL_RST}
	@echo -e ${CL_YLW}"/yNmyydNNMMMMmsyooMMMMMMN+.h    /MMMMMMMMMMMMMM/    y.oNMMMMMMosyymMMMMNNdyhmNy+"${CL_RST}
	@echo -e ${CL_YLW}"::oNMMmmdyhhmNMd/:yMMMMMMy.h    /N+hNMMMMMMNy+d+    y.yMMMMMMy//dMNdhyhddmMMNo--"${CL_RST}
	@echo -e ${CL_YLW}"---/hNMMMMMNNdhhdo+dMMMMMm-h    /M: `:yMMh/``-No    y-mMMMMMd+odhydNNMMMMMNh/---"${CL_RST}
	@echo -e ${CL_YLW}":::ohhhdNNMMMMMNdo:oMMMMMy.h    :MMMm:yMMd.NMMM+    y`sMMMMMo+odNMMMMMNNmyyyo---"${CL_RST}
	@echo -e ${CL_YLW}"::::omNmmhdddmdddds/dMMMMd-h     hMMMo.//..MMMN     y-dMMMMd+oddddmddddmmNm+-..."${CL_RST}
	@echo -e ${CL_YLW}"-----+ydmNMMMMMNNdyoyMMMMm.m     yMMMs    .MMMM`    d.mMMMMyosdmNMMMMMNNd+-`````"${CL_RST}
	@echo -e ${CL_YLW}"`````--::::ossdshhhhymMMMM+M-    sMMMs    .MMMM`   .M+MMMMm+yhhhydys+::::`      "${CL_RST}
	@echo -e ${CL_YLW}"           -hhodhyyhoomMMMNNm:   .mMMs     MMMo   -mNNMMMm++yhyhdodh`           "${CL_RST}
	@echo -e ${CL_YLW}"           .NMMNNmmddo:yNMMMNNh/. .hMo     mN+ ./yNNMMMNy-sddmmNMMMN.           "${CL_RST}
	@echo -e ${CL_YLW}"           .hhssdmmddyyysomMMMNNmh+:o-     +++hdNMMMMdsossyddmmdsssd`           "${CL_RST}
	@echo -e ${CL_YLW}"           `ho+sNmdsdNdss:sMMNMMMMNNmy:  -smNNMMNMNNMo-oodNmsdmm+:/s`           "${CL_RST}
	@echo -e ${CL_YLW}"           `o///yo:+hy:--..MNNNNNNMMNNNyyNNNMMNNNNNNM/://+dms+ys   `            "${CL_RST}
	@echo -e ${CL_YLW}"                           -:::::ydNMMmssmMMNdy:::::-.......``-.                "${CL_RST}
	@echo -e ${CL_YLW}"                                 ..-:dmyyNd:-..                                 "${CL_RST}
	@echo -e ${CL_YLW}"                                     +/o+++                                     "${CL_RST}
	@echo -e ${CL_YLW}"                                                                                "${CL_RST}
	@echo -e ${CL_RED}"                                invictrixrom.com                                "${CL_RST}
	@echo -e ${CL_YLW}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
	@echo -e ${CL_CYN}"Package zip: "${CL_MAG} $(INVICTRIX_TARGET_PACKAGE)                                 ${CL_RST}
	@echo -e ${CL_CYN}"Package md5: "${CL_MAG}" `cat $(INVICTRIX_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"${CL_RST}
	@echo -e ${CL_CYN}"Package size:"${CL_MAG}" `du -h $(INVICTRIX_TARGET_PACKAGE) | cut -f 1`            "${CL_RST}
	@echo -e ${CL_YLW}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}

#!/bin/bash
sed -i -e 's/\(^res_width=\).*/\11280/' -e 's/\(^res_height=\).*/\1960/' -e 's/\(^res_bpp=\).*/\132/' -e 's/\(^res_bpp=\).*/\132/' "vars.cfg"

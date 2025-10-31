/*
 *     Copyright (C) 2025 Valeri Gokadze
 *
 *     Musify is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     Musify is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 *
 *     For more information about Musify, including how to contribute,
 *     please visit: https://github.com/gokadzev/Musify
 */

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:musify/utilities/common_variables.dart';
import 'package:musify/utilities/url_launcher.dart';

class AnnouncementBox extends StatelessWidget {
  const AnnouncementBox({
    super.key,
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.url,
    this.onDismiss,
  });
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final String url;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchURL(Uri.parse(url)),
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: commonBarRadius),
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(Icons.notifications, color: textColor, size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              if (onDismiss != null)
                IconButton(
                  icon: Icon(FluentIcons.dismiss_24_filled, color: textColor),
                  onPressed: onDismiss,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

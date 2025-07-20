// project_card.dart
import 'package:flutter/material.dart';
import 'package:pta_contrib/model/model.dart';
import 'package:pta_contrib/widgets/form.dart';

/// A StatelessWidget that displays a project's information in a card format.
/// It is tappable and navigates to the ContributionForm when tapped.
class ProjectCard extends StatelessWidget {
  final Project project; // The project data to display
  final VoidCallback? onChooseProject; // Callback when the project is chosen (e.g., added to "my projects")

  /// Constructor for ProjectCard.
  /// [project] is required. [onChooseProject] is optional.
  const ProjectCard({
    Key? key,
    required this.project,
    this.onChooseProject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector makes the entire card tappable
      onTap: () {
        // Navigate to the ContributionForm when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContributionForm(project: project),
          ),
        );
      },
      child: Card(
        // Use the card theme defined in app_theme.dart
        elevation: 6, // Slightly higher elevation for a more prominent look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18), // More rounded corners
        ),
        clipBehavior: Clip.antiAlias, // Ensures content is clipped to the rounded corners
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Image.network(
              project.imageUrl,
              height: 180, // Fixed height for the image
              width: double.infinity, // Image takes full width of the card
              fit: BoxFit.cover, // Cover the entire area, cropping if necessary
              // Placeholder for image loading errors or while loading
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 180,
                  color: Colors.grey[200],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                // Fallback image/icon if the URL fails
                return Container(
                  height: 180,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey[600],
                      size: 50,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Title
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                    maxLines: 2, // Limit title to two lines
                    overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                  ),
                  const SizedBox(height: 8),
                  // Project Description
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3, // Limit description to three lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  // Progress Indicator
                  LinearProgressIndicator(
                    value: project.currentAmount / project.targetAmount,
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                    minHeight: 8, // Thicker progress bar
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 8),
                  // Current and Target Amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${project.currentAmount.toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'of \$${project.targetAmount.toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).darkText.withOpacity(0.7),
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // "Choose Project" button (optional, for adding to chosen list)
                  if (onChooseProject != null)
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: onChooseProject,
                        icon: const Icon(Icons.add_task),
                        label: Text(
                          'Choose Project',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:pta_contrib/core/theme/app_theme.dart';
import 'package:pta_contrib/Features/Projects/Data/model/model.dart';
import 'package:pta_contrib/shared/widgets/form.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onChooseProject;

  const ProjectCard({
    super.key,
    required this.project,
    this.onChooseProject,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContributionForm(project: project),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildImage(context),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context),
                  const SizedBox(height: 8),
                  _buildDescription(context),
                  const SizedBox(height: 12),
                  _buildProgressBar(context),
                  const SizedBox(height: 8),
                  _buildFundingRow(context),
                  if (onChooseProject != null) ...[
                    const SizedBox(height: 16),
                    Center(child: _buildChooseButton(context)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Image.network(
      project.imageUrl,
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
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
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      project.title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      project.description,
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return LinearProgressIndicator(
      value: project.currentAmount / project.targetAmount,
      backgroundColor: Theme.of(context)
          .primaryColor
          .withAlpha((0.2 * 255).toInt()), // Adjusted correct alpha
      valueColor:
          AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
      minHeight: 8,
      borderRadius: BorderRadius.circular(10),
    );
  }

  Widget _buildFundingRow(BuildContext context) {
    return Row(
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
                color: AppTheme.darkText.withAlpha((0.7 * 255).toInt()),
              ),
        ),
      ],
    );
  }

  Widget _buildChooseButton(BuildContext context) {
    return ElevatedButton.icon(
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
    );
  }
}

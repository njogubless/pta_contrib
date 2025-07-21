
import 'package:flutter/material.dart';
import 'package:pta_contrib/model/model.dart';
import 'package:pta_contrib/widgets/form.dart';


class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onChooseProject; 


  const ProjectCard({
    Key? key,
    required this.project,
    this.onChooseProject,
  }) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 
            Image.network(
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, 
                  ),
                  const SizedBox(height: 8),
         
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3, 
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  
                  LinearProgressIndicator(
                    value: project.currentAmount / project.targetAmount,
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                    minHeight: 8, 
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 8),
          
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
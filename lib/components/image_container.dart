import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/image_picker_service.dart';
import 'image_card.dart';

class ImageContainer extends StatefulWidget {
  ImageContainer({
    Key? key,
    required this.images,
    required this.onPiced,
  }) : super(key: key);
  List<XFile> images;
  final void Function(List<XFile> images) onPiced;

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  final service = ImagePickerService();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.images.isNotEmpty
            ? SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemCount: widget.images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ImageCard(
                            file: widget.images[index],
                            delete: (value) {
                              widget.images.remove(value);

                              setState(() {});
                            },
                          );
                        }),
                    Positioned(
                      bottom: 7,
                      right: 7,
                      child: IconButton(
                        onPressed: () async {
                          final value = await service.pickImages();
                          if (value != null) {
                            widget.onPiced(value);
                            widget.images = value;
                            setState(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.camera_enhance,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: IconButton(
                    onPressed: () async {
                      final value = await service.pickImages();
                      if (value != null) {
                        widget.onPiced(value);
                        widget.images = value;
                        setState(() {});
                      }
                    },
                    icon: const Icon(
                      Icons.camera_enhance,
                      size: 35,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

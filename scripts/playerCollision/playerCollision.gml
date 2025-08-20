
function playerCollision() {
    
    static debugSphere = NULL;
    
    if (debugSphere == NULL) {
        debugSphere = instance_create_layer(0, 0, "Objects", Sphere);
        
        vertex_begin(debugSphere.vbuffer, Camera.vertex_format);
        loadModel(debugSphere.vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Sphere.obj");
        vertex_end(debugSphere.vbuffer);
    }
    
    var hitbox = getHitbox(Floor.x, Floor.y, Floor.scaleX, Floor.scaleY);
    var point = new Vector(Player.x, Player.y);
    
    with (debugSphere) {
        
        self.x = other.x;
        self.y = other.y;
        self.z = other.z;
        
        self.scaleX = 10;
        self.scaleY = 10;
        self.scaleZ = 100;
    }
    
    if (pointInHitbox(point, hitbox)) {
        println("Collision");
    } else println("No collision");
}